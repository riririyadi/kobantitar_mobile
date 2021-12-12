import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_config/config.dart' as config;
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/update_akun_sukses.dart';

class UbahPasswordController extends GetxController {
  String token = "";
  final userData = GetStorage();

  final ubahPasswordFormKey = GlobalKey<FormState>();

  var passwordLamaController = TextEditingController();
  var passwordBaruController = TextEditingController();
  var konfirmPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    token = userData.read("token");
  }

  @override
  void onClose() {
    passwordLamaController.dispose();
    passwordBaruController.dispose();
    konfirmPasswordController.dispose();

    super.onClose();
  }

  Future<String?> ubahPassword(String passwordLama, String passwordBaru) async {
    final response = await http.put(
      Uri.parse("${config.baseURL}/account/password"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'old_password': passwordLama,
        'new_password': passwordBaru
      }),
    );

    if (response.statusCode == 200) {
      Get.to(() => UpdateAkunSukses());
      return "ok";
    } else if (response.statusCode == 403) {
      Get.snackbar("Oops", "Password yang anda masukkan salah");
      return null;
    } else {
      return null;
    }
  }
}
