import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/app_setting.dart';
import 'package:kobantitar_mobile/api_config/config.dart' as config;
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/models/instansi.dart';
import 'package:kobantitar_mobile/models/me.dart';

class AkunController extends GetxController {
  var isSettingLoaded = false.obs;
  var isMeLoaded = false.obs;

  String token = "";
  final userData = GetStorage();

  var setting = AppSetting();
  var me = Me();

  final ubahPasswordFormKey = GlobalKey<FormState>();

  var passwordLamaController = TextEditingController();
  var passwordBaruController = TextEditingController();
  var konfirmPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    token = userData.read("token");
    getSetting();
    getMe();

    // ignore: avoid_print
  }

  @override
  void onClose() {
    passwordLamaController.dispose();
    passwordBaruController.dispose();
    konfirmPasswordController.dispose();

    super.onClose();
  }

  void getMe() async {
    final data = await Service.fetchMe(token);
    if (data != null) {
      me = data;
      isMeLoaded(true);
    }
  }

  void getSetting() async {
    final data = await Service.fetchSetting();
    if (data != null) {
      setting = data;
      isSettingLoaded(true);
    }
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
      return "ok";
    } else {
      return null;
    }
  }

  Future<String?> deleteDevice() async {
    final response = await http.delete(
      Uri.parse("${config.baseURL}/devices"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'token': token,
      }),
    );
  }

  void deleteLocalToken() {
    userData.remove("token");
    userData.remove("anggota");
    userData.remove("PIN");
  }
}
