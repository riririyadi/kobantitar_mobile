import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/app_setting.dart';
import 'package:kobantitar_mobile/models/informasi.dart';
import 'package:kobantitar_mobile/models/kobmart.dart';
import 'package:kobantitar_mobile/models/me.dart';
import 'package:kobantitar_mobile/models/simpanan.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  dynamic argumentData = Get.arguments;
  var me = Me();
  var informasi = Informasi();
  var setting = AppSetting();
  var kobmart = DataKobmart();
  var simpanan = Simpanan();
  var isLoaded = false.obs;
  var isSimpananLoaded = false.obs;
  var isKobmartLoading = false.obs;
  var isSettingLoading = false.obs;
  var isInformasiLoading = false.obs;
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
    token = userData.read("token");
    role = userData.read("role");

    _initPackageInfo();
    getMe();
    getSimpanan();
    getKobmart();
    getSetting();
    getInformasi();

    super.onInit();
  }

  @override
  void onClose() {
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
      if (_packageInfo.version != setting.appVersionName) {
        Get.defaultDialog(
            title: "Latest update is available",
            titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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

  void getInformasi() async {
    try {
      isInformasiLoading(true);
      final data = await Service.fetchInformasi(token);
      if (data != null) {
        informasi = data;
        Get.snackbar("title", informasi.status!);
      }
    } finally {
      isInformasiLoading(false);
    }
  }

  void getKobmart() async {
    try {
      isKobmartLoading(true);
      final data = await Service.fetchKobmart(token);
      if (data != null) {
        kobmart = data.data!;
      }
    } finally {
      isKobmartLoading(false);
    }
  }
}
