import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:kobantitar_mobile/screens/auth_screens/login_screen.dart';

class HalamanPINController extends GetxController {
  final pinController = TextEditingController();
  var pin = [1, 1, 1, 1, 1, 1];
  var listPin = <int>[];

  DeepCollectionEquality dcEquality = DeepCollectionEquality();

  @override
  void onInit() {
    super.onInit();
    listPin = [];
  }

  @override
  void onReady() {
    super.onReady();
    pinController.addListener(() {
      bool equality = dcEquality.equals(pin, listPin);

      if (equality) {
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
        listPin = [];
        print(listPin);
        Future.delayed(Duration(seconds: 2), () {
          Get.offAll(() => LoginScreen());
        });
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    pinController.dispose();
    listPin.clear();
  }
}
