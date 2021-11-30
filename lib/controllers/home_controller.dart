import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/kobmart.dart';
import 'package:kobantitar_mobile/models/me.dart';
import 'package:kobantitar_mobile/models/simpanan.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeController extends GetxController {
  dynamic argumentData = Get.arguments;
  var me = Me();
  var kobmart = DataKobmart();
  var simpanan = Simpanan();
  var isLoaded = false.obs;
  var isSimpananLoaded = false.obs;
  var isKobmartLoading = false.obs;
  final userData = GetStorage();
  String token = "";
  String role = "NON ANGGOTA";
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
    // role = userData.read("role");

    Future.delayed(Duration(seconds: 2), () {
      getMe();
      getSimpanan();
      getKobmart();
      _initPackageInfo();
    });

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    if (info.appName != "Unknown") {
      _packageInfo = info;
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
