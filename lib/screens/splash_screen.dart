import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_screens/halaman_pin.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.to(() => HalamanPIN()),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffEE6A6A), Color(0xffC30707)]),
          ),
          child: Center(
            child: Image(
              image: AssetImage("assets/kobantitar-logo.png"),
              height: 94.0,
              width: 225.0,
            ),
          ),
        ),
      ),
    );
  }
}
