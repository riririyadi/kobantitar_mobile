import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/api_config/config.dart' as config;
import 'package:kobantitar_mobile/models/app_setting.dart';
import 'package:kobantitar_mobile/models/bank.dart';
import 'package:kobantitar_mobile/models/dashboard.dart';
import 'package:kobantitar_mobile/models/detail_pengajuan.dart';
import 'package:kobantitar_mobile/models/informasi.dart';
import 'package:kobantitar_mobile/models/instansi.dart';
import 'package:kobantitar_mobile/models/jenis_kendaraan.dart';
import 'package:kobantitar_mobile/models/kobmart.dart';
import 'package:kobantitar_mobile/models/kredit_barang_calculation.dart';
import 'package:kobantitar_mobile/models/kredit_barang_configuration.dart';
import 'package:kobantitar_mobile/models/kredit_kendaraan_calculation.dart';
import 'package:kobantitar_mobile/models/kredit_kendaraan_configuration.dart';
import 'package:kobantitar_mobile/models/logam_mulia_calculation.dart';
import 'package:kobantitar_mobile/models/logam_mulia_configuration.dart';
import 'package:kobantitar_mobile/models/me.dart';
import 'package:kobantitar_mobile/models/notifikasi.dart';
import 'package:kobantitar_mobile/models/pengajuan.dart';
import 'package:kobantitar_mobile/models/simpanan.dart';
import 'package:kobantitar_mobile/models/tagihan.dart';
import 'package:kobantitar_mobile/models/kontak.dart';
import 'package:flutter/services.dart';
import 'package:kobantitar_mobile/screens/pengajuan_screens/detail_pengajuan.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Service extends GetConnect {
  static var client = http.Client();

  static Future<AppSetting?> fetchSetting() async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/setting"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = jsonEncode(json["data"]);
      return appSettingFromJson(data);
    } else {
      return null;
    }
  }

  static Future<List<Instansi>?> fetchInstansi() async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/instansi"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = jsonEncode(json["data"]);
      return instansiFromJson(data);
    } else {
      return null;
    }
  }

  static Future<List<Bank>?> fetchBank() async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/bank"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = jsonEncode(json["data"]);
      return bankFromJson(data);
    } else {
      return null;
    }
  }

  //Upload Image
  static Future<String> uploadImage(File file) async {
    try {
      final form = FormData({
        'file': MultipartFile(file, filename: 'dokumen.jpg'),
      });

      final response = await client.post(Uri.parse("${config.baseURL}/upload"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: form);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final data = json["data"]["file_id"];
        return data;
      } else {
        return Future.error(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  static Future<Me?> fetchMe(String token) async {
    try {
      final response = await client.get(
        Uri.parse("${config.baseURL}/me"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final data = jsonEncode(json["data"]);
        print(data);
        return meFromJson(data);
      } else {
        print("Ini me ${response.statusCode}");
        return null;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  static Future<Simpanan?> fetchSimpanan(String token) async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/simpanan"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = jsonEncode(json["data"]);
      // print(data);
      return simpananFromJson(data);
    } else {
      print("Ini simp ${response.statusCode}");
      return null;
    }
  }

  static Future<KreditKendaraanConfiguration?>
      fetchKreditKendaraanConfiguration(String token) async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/pengajuan/kreditkendaraan/configuration"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final json = kreditKendaraanConfigurationFromJson(response.body);
      // final data = jsonEncode(json["data"]);
      print(json);

      return json;
    } else {
      return null;
    }
  }

  static Future<List<JenisKendaraan>?> fetchJenisKendaraanByBrandId(
      String token, int id) async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/pengajuan/kreditkendaraan/brand/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = jsonEncode(json['data']["products"]);
      return jenisKendaraanFromJson(data);
    } else {
      return null;
    }
  }

  static Future<KreditKendaraanCalculation?> fetchKreditBarangCalculation(
      String token, dynamic productId, String tenorId) async {
    final response = await client.get(
      Uri.parse(
          "${config.baseURL}/pengajuan/kreditkendaraan/calculation?product_id=$productId&tenor_id=$tenorId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return kreditKendaraanCalculationFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<LogamMuliaConfiguration?> fetchPengajuanLogamMuliaConfig(
      String token) async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/pengajuan/logammulia/configuration"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return logamMuliaConfigurationFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<LogamMuliaCalculation?> fetchPengajuanLogamMuliaCalculation(
      String token, int amountId, String tenorId) async {
    final response = await client.get(
      Uri.parse(
          "${config.baseURL}/pengajuan/logammulia/calculation?amount_id=$amountId&tenor_id=$tenorId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return logamMuliaCalculationFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<KreditBarangConfiguration?> fetchPengajuanBarangLainConfig(
      String token) async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/pengajuan/kreditbarang/configuration"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print(jsonEncode(response.body));
      return kreditBarangConfigurationFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<BarangLainCalculation?> fetchPengajuanBarangCalculation(
      String token, int nominal, String tenorId) async {
    final response = await client.get(
      Uri.parse(
          "${config.baseURL}/pengajuan/kreditbarang/calculation?nominal=$nominal&tenor_id=$tenorId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print(jsonEncode(response.body));
      return barangLainCalculationFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<Kobmart?> fetchKobmart(String token) async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/kobmart"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print(jsonEncode(response.body));
      return kobmartFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<TagihanList?> fetchTagihan(String token) async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/tagihan"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return tagihanListFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<PengajuanList?> fetchPengajuan(String token) async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/pengajuan"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return pengajuanListFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<DetailDataPengajuan?> fetchDetailPengajuan(
      String token, int id) async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/pengajuan/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print("Detail Pengajuan " + response.statusCode.toString());
      return detailDataPengajuanFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<Informasi?> fetchInformasi(String token) async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/informasi"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return informasiFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<Dashboard?> fetchDashboard(String token) async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/dashboard"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      var das = dashboardFromJson(response.body);
      print(response.body);
      print(das.data?.promoImageUrl);
      return das;
    } else {
      return null;
    }
  }

  static Future<Kontak?> fetchKontak(String token) async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/kontak"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return kontakFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<File> loadPdfNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    return _storeFile(url, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  static Future<Notifikasi?> fetchNotifikasi(String token) async {
    final response = await client.get(
      Uri.parse("${config.baseURL}/notification"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return notifikasiFromJson(response.body);
    } else {
      return null;
    }
  }
}
