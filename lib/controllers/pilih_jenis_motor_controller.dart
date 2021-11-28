import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/ApiServices/service.dart';
import 'package:kobantitar_mobile/models/jenis_kendaraan.dart';

class PilihJenisMotorController extends GetxController {
  final userData = GetStorage();
  late String token;
  dynamic argumentData = Get.arguments;
  List<JenisKendaraan>? listKendaraan = <JenisKendaraan>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    token = userData.read("token");
    print(argumentData);
    print(token);
    getJenisKendaraanByBrandId();

    super.onInit();
  }

  @override
  void onClose() {
    super.onInit();
  }

  void getJenisKendaraanByBrandId() async {
    try {
      isLoading(true);
      var data =
          await Service.fetchJenisKendaraanByBrandId(token, argumentData);
      if (data != null) {
        listKendaraan = data;
      }
    } finally {
      isLoading(false);
    }
  }
}
