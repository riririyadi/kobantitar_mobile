import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kobantitar_mobile/api_config/config.dart' as config;

class LaporanKeuanganViewDocumentController extends GetxController {
  var isLoaded = false.obs;
  late File file;
  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    getPdfNetwork();
  }

  void getPdfNetwork() async {
    final data = await Service.loadPdfNetwork(config.baseURI + argumentData);
    if (data != null) {
      file = data;
      isLoaded(true);
    }
  }
}
