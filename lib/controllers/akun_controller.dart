import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/api_config/config.dart' as config;
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/models/me.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AkunController extends GetxController {
  var isMeLoaded = false.obs;

  String token = "";
  final userData = GetStorage();

  var me = Me();

  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void onInit() {
    super.onInit();
    token = userData.read("token");
    _initPackageInfo();
    getMe();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getMe() async {
    final data = await Service.fetchMe(token);
    if (data != null) {
      me = data;
      isMeLoaded(true);
    }
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    if (info.version != "Unknown") {
      packageInfo = info;
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
