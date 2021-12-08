import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/app_setting.dart';
import 'package:kobantitar_mobile/models/dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/api_config/config.dart' as config;
import 'package:kobantitar_mobile/models/kobmart.dart';
import 'package:kobantitar_mobile/models/me.dart';
import 'package:kobantitar_mobile/models/simpanan.dart';
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
    checkVersion();
    super.onReady();
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
      await launch(uri,
          forceWebView: true, forceSafariVC: true, enableJavaScript: true);
    }
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    if (info.version != "Unknown") {
      _packageInfo = info;
    }
  }

  void getMe() async {
    final data = await Service.fetchMe(token);
    if (data != null) {
      me = data;

      isLoaded(true);
    }
  }

  void getSimpanan() async {
    final data = await Service.fetchSimpanan(token);
    if (data != null) {
      simpanan = data;
      isSimpananLoaded(true);
    }
  }

  void getDashboard() async {
    final data = await Service.fetchDashboard(token);
    if (data != null) {
      dashboard = data;
      isDashboardLoaded(true);
    }
  }

  void checkVersion() {
    if (_packageInfo.version != setting.appVersionName) {
      Get.defaultDialog(
          title: "Latest update is available",
          titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          content:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
                "Your app version is not uptodate, this app version is ${_packageInfo.version}",
                style: TextStyle(fontSize: 14))
          ]),
          cancel: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Later", style: TextStyle(fontSize: 14)),
            ),
          ),
          confirm: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Update Now", style: TextStyle(fontSize: 14)),
            ),
          ),
          contentPadding: EdgeInsets.all(10),
          titlePadding: EdgeInsets.all(10));
    }
  }
}
