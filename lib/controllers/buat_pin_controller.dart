// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/screens/home_screen.dart';

class BuatPINController extends GetxController {
  var pin = "";
  var konfirmPin = "";
  final userData = GetStorage();

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
      userData.write("PIN", konfirmPin);
      Get.offAll(() => HomeScreen());
    } else {
      Get.snackbar(pin, konfirmPin);
    }
  }
}
