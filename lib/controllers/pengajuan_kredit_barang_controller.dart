import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengajuanKreditBarang extends GetxController {
  var jenisBarangController = TextEditingController();
  var tipeBarangController = TextEditingController();
  var nilaiBarangController = TextEditingController();
  var tenorController = TextEditingController();
  var tglPembayaranController = TextEditingController();

  @override
  void onInit() {
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
}
