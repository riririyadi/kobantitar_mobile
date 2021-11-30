import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/kredit_kendaraan_configuration.dart';

class KreditKendaraanController extends GetxController {
  var tenorController = TextEditingController();
  var tglPembayaranController = TextEditingController();
  final userData = GetStorage();
  late String token;
  var isLoading = false.obs;

  List<Brand>? merkKendaraan = <Brand>[].obs;
  List<TenorConfig>? tenors = <TenorConfig>[].obs;

  @override
  void onInit() {
    token = userData.read("token");
    getKendaraan();
    super.onInit();
  }

  @override
  void onClose() {
    tenorController.dispose();
    tglPembayaranController.dispose();
    super.onInit();
  }

  void getKendaraan() async {
    try {
      isLoading(true);
      final data = await Service.fetchKreditKendaraanConfiguration(token);
      if (data != null) {
        final merk_kendaraan = data.data!.brands;
        merkKendaraan = merk_kendaraan;
      }
    } finally {
      isLoading(false);
    }
  }
}
