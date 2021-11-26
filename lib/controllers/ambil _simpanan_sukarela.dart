import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmbilSimpananSukarela extends GetxController {
  var nominalController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    nominalController.dispose();
    super.onInit();
  }
}
