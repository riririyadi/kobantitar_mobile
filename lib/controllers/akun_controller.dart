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
  var isSettingLoading = false.obs;
  var isMeLoading = false.obs;
  var isInstansiLoading = false.obs;
  List<Instansi> instansis = [];

  String token = "";
  final userData = GetStorage();

  var setting = AppSetting();
  var me = Me();

  final mengundurkanDiriFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final ubahPasswordFormKey = GlobalKey<FormState>();

  var namaController = TextEditingController();
  var jenisKelaminController = TextEditingController();
  var nikController = TextEditingController();
  var alamatController = TextEditingController();
  var instansiController = TextEditingController();
  var jabatanController = TextEditingController();
  var nipController = TextEditingController();
  var passwordLamaController = TextEditingController();
  var passwordBaruController = TextEditingController();
  var konfirmPasswordController = TextEditingController();
  var alasanPengunduranDiriController = TextEditingController();

  var passwordController = TextEditingController();

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
    namaController.dispose();
    jenisKelaminController.dispose();
    nikController.dispose();
    alamatController.dispose();
    instansiController.dispose();
    jabatanController.dispose();
    nipController.dispose();
    passwordLamaController.dispose();
    passwordBaruController.dispose();
    konfirmPasswordController.dispose();
    alasanPengunduranDiriController.dispose();

    super.onClose();
  }

  void getSetting() async {
    try {
      isSettingLoading(true);
      final data = await Service.fetchSetting();
      if (data != null) {
        setting = data;
      }
    } finally {
      isSettingLoading(false);
    }
  }

  void getMe() async {
    try {
      isMeLoading(true);

      final data = await Service.fetchMe(token);
      if (data != null) {
        me = data;
      }
    } finally {
      isMeLoading(false);
    }
  }

  void getInstansi() async {
    try {
      isInstansiLoading(true);
      var data = await Service.fetchInstansi();
      if (data != null) {
        instansis = data;
      }
    } finally {
      isInstansiLoading(false);
    }
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
  }
}
