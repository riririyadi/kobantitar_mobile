import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:url_launcher/url_launcher.dart';

class LaporanKeuanganController extends GetxController {
  var isLoading = false.obs;
  late File file;
  dynamic argumentData = Get.arguments;
  String uri = "";
  @override
  void onInit() {
    uri = argumentData;
    super.onInit();
    getPdfNetwork();
  }

  void getPdfNetwork() async {
    try {
      isLoading(true);
      final data = await Service.loadPdfNetwork(uri);
      if (data != null) {
        file = data;
      }
    } finally {
      isLoading(false);
    }
  }
}
