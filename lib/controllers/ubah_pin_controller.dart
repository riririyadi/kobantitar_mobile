// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/screens/home_screen.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/update_akun_sukses.dart';

class UbahPINController extends GetxController {
  String pinLama = "";
  String pinBaru = "";
  String konfirmPinBaru = "";
  String? savedPIN;
  final userData = GetStorage();

  @override
  void onInit() {
    savedPIN = userData.read("PIN");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void savePIN() {
    if (konfirmPinBaru == pinBaru) {
      userData.write("PIN", konfirmPinBaru);
      Get.offAll(() => UpdateAkunSukses());
    } else {
      Get.snackbar("Oops", "Konfirmasi PIN harus sesuai");
    }
  }
}
