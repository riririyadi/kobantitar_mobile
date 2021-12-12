import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/screens/auth_screens/halaman_pin.dart';
import 'package:kobantitar_mobile/screens/auth_screens/login_screen.dart';

class SplashScreenController extends GetxController {
  String? pin;
  String? token;
  final userData = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    token = userData.read("token");
    pin = userData.read("PIN");
    loading();
  }

  Future<void> loading() async {
    Timer(Duration(seconds: 2), () {
      if (token == null) {
        Get.off(() => LoginScreen());
      } else {
        Get.off(() => HalamanPIN());
      }
    });
  }
}
