import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/screens/auth_screens/login_screen.dart';
import 'package:kobantitar_mobile/screens/home_screen.dart';

class HalamanPINController extends GetxController {
  final pinController = TextEditingController();

  String? pinToken;
  final userData = GetStorage();

  var pinDefault = [1, 1, 1, 1, 1, 1];
  var listPin = <int>[];
  var pin = <int>[];
  DeepCollectionEquality dcEquality = DeepCollectionEquality();

  @override
  void onInit() {
    pinToken = userData.read("PIN");
    if (pinToken != null) {
      for (int i = 0; i < pinToken!.length; i++) {
        var char = int.parse(pinToken![i]);
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

      if (equality) {
        Future.delayed(Duration(milliseconds: 500), () {
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
