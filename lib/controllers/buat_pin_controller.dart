// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/screens/home_screen.dart';

class BuatPINController extends GetxController {
  final pinBaru = TextEditingController();
  final konfirmPin = TextEditingController();
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
    if (konfirmPin.text == pinBaru.text) {
      userData.write("PIN", konfirmPin.text);
      Get.offAll(() => HomeScreen());
    } else {}
  }
}
