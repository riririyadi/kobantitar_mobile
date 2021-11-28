import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/ApiServices/service.dart';
import 'package:kobantitar_mobile/models/logam_mulia_configuration.dart';

class PengajuanLogamMuliaController extends GetxController {
  var jenisBarangController = TextEditingController();
  var tipeBarangController = TextEditingController();
  var nilaiBarangController = TextEditingController();
  var tenorController = TextEditingController();
  var tglPembayaranController = TextEditingController();
  final userData = GetStorage();
  late String token;
  List<Amount>? amountList = <Amount>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    token = userData.read("token");
    getPengajuanLogamMuliaConfig();
    super.onInit();
  }

  @override
  void onClose() {
    jenisBarangController.dispose();
    tipeBarangController.dispose();
    nilaiBarangController.dispose();
    tenorController.dispose();
    tglPembayaranController.dispose();
    super.onInit();
  }

  void getPengajuanLogamMuliaConfig() async {
    try {
      isLoading(true);
      final res = await Service.fetchPengajuanLogamMuliaConfig(token);
      if (res != null) {}
      amountList = res!.data!.amounts;
      for (var amountdata in amountList!) {
        print(amountdata.amount);
      }
    } finally {
      isLoading(false);
    }
  }
}
