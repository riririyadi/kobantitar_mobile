import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/models/bank.dart';
import 'package:kobantitar_mobile/models/instansi.dart';
import 'package:kobantitar_mobile/models/me.dart';
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

  static Future<Me?> fetchMe(token) async {
    final response = await client.get(
      Uri.parse("${BASE_URL}/me"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = jsonEncode(json["data"]);
      // print(data);
      return meFromJson(data);
    } else {
      return null;
    }
  }

  static Future<Simpanan?> fetchSimpanan(token) async {
    final response = await client.get(
      Uri.parse("${BASE_URL}/simpanan"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = jsonEncode(json["data"]);
      // print(data);
      return simpananFromJson(data);
    } else {
      return null;
    }
  }

  static Future<String?> fetchKendaraan(token) async {
    final response = await client.get(
      Uri.parse("${BASE_URL}/pengajuan/kreditkendaraan/configuration"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      // final data = jsonEncode(json["data"]);
      print(json);
      return json;
    } else {
      return null;
    }
  }
}
