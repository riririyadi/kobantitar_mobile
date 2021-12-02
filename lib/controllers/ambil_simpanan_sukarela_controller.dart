import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/api_config/config.dart' as config;

class AmbilSimpananSukarelaController extends GetxController {
  var nominalController = TextEditingController();
  final nominalFormKey = GlobalKey<FormState>();

  final userData = GetStorage();
  late String token;

  @override
  void onInit() {
    token = userData.read("token");
    super.onInit();
  }

  @override
  void onClose() {
    nominalController.dispose();
    super.onInit();
  }

  Future<String?> postAjukanPengambilan(int nominal) async {
    final response = await http.post(
      Uri.parse("${config.baseURL}/simpanan/sukarela/pengambilan"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{'nominal': nominal}),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final id = jsonEncode(json['data']['id']);
      print(id);

      return id;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
