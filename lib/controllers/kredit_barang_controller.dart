import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KreditBarangController extends GetxController {
  var tenorController = TextEditingController();
  var tglPembayaranController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    tenorController.dispose();
    tglPembayaranController.dispose();
    super.onInit();
  }
}
