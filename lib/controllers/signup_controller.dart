import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:kobantitar_mobile/models/instansi.dart';
import 'package:kobantitar_mobile/services/service.dart';

class SignUpController extends GetxController {
  final list = [].obs;
  final bankList = [].obs;

  final dataPribadiFormKey = GlobalKey<FormState>();

  var namaController = TextEditingController();
  var jenisKelaminController = TextEditingController();
  var nikController = TextEditingController();
  var alamatController = TextEditingController();
  var instansiController = TextEditingController();
  var jabatanController = TextEditingController();
  var nipController = TextEditingController();
  var bankController = TextEditingController();
  var noRekController = TextEditingController();
  var cabangController = TextEditingController();
  var emailController = TextEditingController();
  var noHPController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 5), () async {
      if (argumentData != null) {
        Get.snackbar("Hello", argumentData['message']);
      }
    });

    getInstansi();
    getBank();
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
    bankController.dispose();
    noRekController.dispose();
    cabangController.dispose();
    emailController.dispose();
    noHPController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void getInstansi() async {
    var instansis = await Service.fetchInstansi();
    if (instansis != null) {
      // isLoaded = true.obs;
      // instansi2.add(dataInstansi);
      for (var i = 0; i < instansis.length; i++) {
        list.add(instansis[i].name);
      }
      // print(list);
    }
  }

  void getBank() async {
    var banks = await Service.fetchBank();
    if (banks != null) {
      // isLoaded = true.obs;
      // instansi2.add(dataInstansi);
      for (var i = 0; i < banks.length; i++) {
        bankList.add(banks[i].name);
      }
      // print(bankList);
    }
  }
}
