import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/models/bank.dart';
import 'package:kobantitar_mobile/models/instansi.dart';
import 'package:kobantitar_mobile/models/jenis_kendaraan.dart';
import 'package:kobantitar_mobile/models/kredit_kendaraan_configuration.dart';
import 'package:kobantitar_mobile/models/logam_mulia_configuration.dart';
import 'package:kobantitar_mobile/models/me.dart';
import 'package:kobantitar_mobile/models/pengambilan_sukarela.dart';
import 'package:kobantitar_mobile/models/simpanan.dart';

class Service extends GetConnect {
  static var BASE_URL = "https://backend.kobantitar.com/api";

  static var client = http.Client();

  static Future<List<Instansi>?> fetchInstansi() async {
    final response = await client.get(
      Uri.parse("${BASE_URL}/instansi"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = jsonEncode(json["data"]);
      // print(data);
      return instansiFromJson(data);
    } else {
      return null;
    }
  }

  static Future<List<Bank>?> fetchBank() async {
    final response = await client.get(
      Uri.parse("${BASE_URL}/bank"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = jsonEncode(json["data"]);
      // print(data);
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

      final response = await client.post(Uri.parse("${BASE_URL}/upload"),
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
        Uri.parse("${BASE_URL}/me"),
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
    } on HttpException catch (e) {
      print(e);
    }
  }

  static Future<Simpanan?> fetchSimpanan(String token) async {
    final response = await client.get(
      Uri.parse("${BASE_URL}/simpanan"),
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
      Uri.parse("${BASE_URL}/pengajuan/kreditkendaraan/configuration"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final json = kreditKendaraanConfigurationFromJson(response.body);
      // final data = jsonEncode(json["data"]);

      return json;
    } else {
      return null;
    }
  }

  static Future<List<JenisKendaraan>?> fetchJenisKendaraanByBrandId(
      String token, int id) async {
    final response = await client.get(
      Uri.parse("${BASE_URL}/pengajuan/kreditkendaraan/brand/$id"),
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

  static Future<LogamMuliaConfiguration?> fetchPengajuanLogamMuliaConfig(
      String token) async {
    final response = await client.get(
      Uri.parse("${BASE_URL}/pengajuan/logammulia/configuration"),
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
}
