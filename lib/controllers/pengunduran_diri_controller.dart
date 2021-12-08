import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_config/config.dart' as config;
import 'package:http/http.dart' as http;

class PengunduranDiriController extends GetxController {
  var alasanPengunduranDiriController = TextEditingController();
  var passwordController = TextEditingController();
  String token = "";
  final userData = GetStorage();
  final mengundurkanDiriFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    token = userData.read("token");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<String?> ajukanPengunduranDiri(String alasan, String password) async {
    final response = await http.post(
      Uri.parse("${config.baseURL}/account/pengunduran-diri"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
      body:
          jsonEncode(<String, String>{'alasan': alasan, 'password': password}),
    );

    if (response.statusCode == 200) {
      return "ok";
    } else {
      return null;
    }
  }
}
