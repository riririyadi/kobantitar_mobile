import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/screens/auth_screens/login_screen.dart';
import 'package:kobantitar_mobile/screens/home_screen.dart';
import 'package:kobantitar_mobile/api_config/config.dart' as config;
import 'package:http/http.dart' as http;

class HalamanPINController extends GetxController {
  final pinController = TextEditingController();

  String? savedPIN;
  final userData = GetStorage();
  String token = "";

  var pinDefault = [1, 1, 1, 1, 1, 1];
  var listPin = <int>[];
  var pin = <int>[];
  DeepCollectionEquality dcEquality = DeepCollectionEquality();

  @override
  void onInit() {
    try{
      token = userData.read("token");
      savedPIN = userData.read("PIN");
    }catch(e,stt){
      Get.offAll(()=> LoginScreen());
    }

    if (savedPIN != null) {
      for (int i = 0; i < savedPIN!.length; i++) {
        var char = int.parse(savedPIN![i]);
        pin.add(char);
      }
    }

    super.onInit();
    listPin = [];
  }

  @override
  void onReady() {
    super.onReady();
    pinController.addListener(() {
      bool equality = dcEquality.equals(pin, listPin);
      if (listPin.length < 6) {
        return;
      }
      print(equality);
      if (equality) {
        Future.delayed(Duration(milliseconds: 200), () {
          Get.defaultDialog(
            title: "",
            content: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text("Please wait")
              ],
            ),
            barrierDismissible: false,
          );
        });
        listPin = [];

        Future.delayed(Duration(seconds: 2), () {
          Get.offAll(() => HomeScreen());
        });
      } else {
        Get.snackbar(
          'Pin salah',
          "Pin yang anda masukkan salah",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          borderRadius: 20,
          margin: EdgeInsets.all(15),
          colorText: Colors.white,
          duration: Duration(seconds: 4),
          isDismissible: true,
          dismissDirection: SnackDismissDirection.HORIZONTAL,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    pinController.dispose();
    listPin.clear();
  }

  Future<String?> deleteDevice() async {
    final response = await http.delete(
      Uri.parse("${config.baseURL}/devices"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'token': token,
      }),
    );
  }

  void deleteLocalToken() {
    userData.remove("token");
    userData.remove("anggota");
    userData.remove("PIN");
  }
}
