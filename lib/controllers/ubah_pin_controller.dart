// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/screens/home_screen.dart';

class UbahPINController extends GetxController {
  var pin = "";
  var konfirmPin = "";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void savePIN() {
    if (pin == konfirmPin) {
      Get.to(() => HomeScreen());
    } else {
      Get.snackbar("Error", "pin harus cocok");
    }
  }
}
