import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/ApiServices/service.dart';
import 'package:kobantitar_mobile/models/kredit_kendaraan_configuration.dart';

class KreditBarangFormController extends GetxController {
  var tenorController = TextEditingController();
  var tglPembayaranController = TextEditingController();
  final userData = GetStorage();
  late String token;
  var isLoading = false.obs;
  var isLoading2 = false.obs;

  List<Tenor>? tenors = <Tenor>[].obs;

  @override
  void onInit() {
    token = userData.read("token");
    getTenor();
    super.onInit();
  }

  @override
  void onClose() {
    tenorController.dispose();
    tglPembayaranController.dispose();
    super.onInit();
  }

  void getTenor() async {
    try {
      isLoading(true);
      final data = await Service.fetchKreditKendaraanConfiguration(token);
      if (data != null) {
        print(jsonEncode(data));

        final tenor = data.data!.tenors;

        tenors = tenor;
        for (var tenordata in tenors!) {
          print(tenordata.caption);
          print(tenordata.id);
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
