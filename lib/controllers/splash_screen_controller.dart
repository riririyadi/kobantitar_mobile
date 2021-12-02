import 'dart:async';

import 'package:get/get.dart';
import 'package:kobantitar_mobile/screens/auth_screens/halaman_pin.dart';
import 'package:kobantitar_mobile/screens/auth_screens/login_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    Timer(Duration(seconds: 2), () {
      Get.off(() => HalamanPIN());
    });
  }
}
