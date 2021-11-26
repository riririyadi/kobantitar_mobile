import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AkunController extends GetxController {
  var namaController = TextEditingController();
  var jenisKelaminController = TextEditingController();
  var nikController = TextEditingController();
  var alamatController = TextEditingController();
  var instansiController = TextEditingController();
  var jabatanController = TextEditingController();
  var nipController = TextEditingController();
  var passwordLamaController = TextEditingController();
  var passwordBaruController = TextEditingController();
  var konfirmPasswordController = TextEditingController();
  var alasanPengunduranDiriController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    namaController.dispose();
    jenisKelaminController.dispose();
    nikController.dispose();
    alamatController.dispose();
    instansiController.dispose();
    jabatanController.dispose();
    nipController.dispose();
    passwordLamaController.dispose();
    passwordBaruController.dispose();
    konfirmPasswordController.dispose();
    alasanPengunduranDiriController.dispose();

    super.onClose();
  }
}
