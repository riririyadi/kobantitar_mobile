// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/kredit_barang_configuration.dart';

class PengajuanKreditBarangLainController extends GetxController {
  var jenisBarangController = TextEditingController();
  var tipeBarangController = TextEditingController();
  var nilaiBarangController = TextEditingController();
  final userData = GetStorage();
  late String token;
  var isLoading = false.obs;
  List<TenorBarang>? tenors = <TenorBarang>[].obs;
  final dataBarangFormKey = GlobalKey<FormState>();
  var nilaiMinimal = 0;

  @override
  void onInit() {
    token = userData.read("token");
    getPengajuanKreditBarangLainConfig();
    super.onInit();
  }

  @override
  void onClose() {
    jenisBarangController.dispose();
    tipeBarangController.dispose();
    nilaiBarangController.dispose();
    super.onInit();
  }

  void printData() {
    print(jenisBarangController.text);
    print(tipeBarangController.text);
    print(nilaiBarangController.text);
  }

  void getPengajuanKreditBarangLainConfig() async {
    try {
      isLoading(true);
      final res = await Service.fetchPengajuanBarangLainConfig(token);
      if (res != null) {
        tenors = res.data!.tenors;
        nilaiMinimal = res.data!.minPrice!;
        for (var tenor in tenors!) {
          print(tenor.caption);
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
