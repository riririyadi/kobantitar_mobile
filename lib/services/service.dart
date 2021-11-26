import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/models/bank.dart';
import 'package:kobantitar_mobile/models/instansi.dart';

class Service extends GetConnect {
  static var BASE_URL = "https://backend.kobantitar.com/api";

  static var client = http.Client();

  static Future<List<Instansi>?> fetchInstansi() async {
    final response = await client.get(Uri.parse("${BASE_URL}/instansi"));
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
    final response = await client.get(Uri.parse("${BASE_URL}/bank"));
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
}
