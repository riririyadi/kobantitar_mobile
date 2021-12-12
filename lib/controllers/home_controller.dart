import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/app_setting.dart';
import 'package:kobantitar_mobile/models/dashboard.dart';
import 'package:kobantitar_mobile/models/kobmart.dart';
import 'package:kobantitar_mobile/models/me.dart';
import 'package:kobantitar_mobile/models/simpanan.dart';
import 'package:kobantitar_mobile/screens/components/webview.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  dynamic argumentData = Get.arguments;
  var me = Me();
  var dashboard = Dashboard();
  var setting = AppSetting();
  var kobmart = DataKobmart();
  var simpanan = Simpanan();
  var isLoaded = false.obs;
  var isSimpananLoaded = false.obs;
  var isKobmartLoaded = false.obs;
  var isSettingLoaded = false.obs;
  var isDashboardLoaded = false.obs;
  final userData = GetStorage();
  String token = "";
  String role = "";
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void onInit() {
    _initPackageInfo();
    token = userData.read("token");
    role = userData.read("role");
    super.onInit();

    getMe();
    getSimpanan();
    getSetting();
    getDashboard();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 5), () {
      checkVersion();
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getSetting() async {
    final data = await Service.fetchSetting();
    if (data != null) {
      setting = data;
      isSettingLoaded(true);
    }
  }

  Future openLink(String uri) async {
    if (await canLaunch(uri)) {
      Get.to(() => KobantitarWebview(judul: "Informasi Terbaru", url: uri));
    }
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    if (info.version != "Unknown") {
      _packageInfo = info;
    }
  }

  Future<Null> refreshData() async {
    await getMe();
    await getSimpanan();
    await getDashboard();
    return;
  }

  Future<void> getMe() async {
    final data = await Service.fetchMe(token);
    if (data != null) {
      me = data;
      isLoaded(true);
      return;
    }
  }

  Future<void> getSimpanan() async {
    final data = await Service.fetchSimpanan(token);
    if (data != null) {
      simpanan = data;
      isSimpananLoaded(true);
      return;
    }
  }

  Future<void> getDashboard() async {
    final data = await Service.fetchDashboard(token);
    if (data != null) {
      dashboard = data;
      isDashboardLoaded(true);
      return;
    }
  }

  void checkVersion() {
    if (_packageInfo.version != setting.appVersionName!) {
      Get.defaultDialog(
          title: "Pembaruan tersedia",
          titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          content: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Update aplikasi anda untuk dukungan yang lebih optimal",
                      style: TextStyle(fontSize: 14))
                ]),
          ),
          cancel: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Nanti", style: TextStyle(fontSize: 14)),
            ),
          ),
          confirm: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Update", style: TextStyle(fontSize: 14)),
            ),
          ),
          contentPadding: EdgeInsets.all(10),
          titlePadding: EdgeInsets.all(10));
    } else {}
  }
}
