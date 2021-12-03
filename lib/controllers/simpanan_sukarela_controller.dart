import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/simpanan.dart';

class SimpananSukarelaController extends GetxController {
  var isLoading = false.obs;
  dynamic argumentData = Get.arguments;
  final userData = GetStorage();
  String token = "";
  var simpanan = Simpanan();

  @override
  void onInit() {
    token = userData.read("token");
    super.onInit();
    getDetailSimpanan();
  }

  void getDetailSimpanan() async {
    try {
      isLoading(true);
      final data = await Service.fetchSimpanan(token);
      if (data != null) {
        simpanan = data;
      }
    } finally {
      isLoading(false);
      // TODO
    }
  }
}
