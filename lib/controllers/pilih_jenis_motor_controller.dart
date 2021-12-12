import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/jenis_kendaraan.dart';

class PilihJenisMotorController extends GetxController {
  final userData = GetStorage();
  late String token;
  dynamic argumentData = Get.arguments;
  List<JenisKendaraan>? listKendaraan = <JenisKendaraan>[].obs;
  var isLoaded = false.obs;

  @override
  void onInit() {
    token = userData.read("token");
    getJenisKendaraanByBrandId();

    super.onInit();
  }

  @override
  void onClose() {
    super.onInit();
  }

  void getJenisKendaraanByBrandId() async {
    final data =
        await Service.fetchJenisKendaraanByBrandId(token, argumentData);
    if (data != null) {
      listKendaraan = data;
      isLoaded(true);
    }
  }
}
