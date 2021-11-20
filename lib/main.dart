import 'package:flutter/material.dart';
import 'package:kobantitar_mobile/screens/home_screens/ambil_simpanan_sukarela.dart';
import 'package:kobantitar_mobile/screens/auth_screens/halaman_pin.dart';
import 'package:kobantitar_mobile/screens/home_screen.dart';
import 'package:kobantitar_mobile/screens/auth_screens/login_screen.dart';
import 'package:kobantitar_mobile/screens/home_screens/simpanan_pokok.dart';
import 'package:kobantitar_mobile/screens/home_screens/simpanan_sukarela.dart';
import 'package:kobantitar_mobile/screens/home_screens/simpanan_wajib.dart';
import 'package:kobantitar_mobile/screens/splash_screen.dart';
import 'package:kobantitar_mobile/screens/home_screens/total_simpanan.dart';
import 'package:get/get.dart';

void main() {
  runApp(const KobantitarApp());
}

class KobantitarApp extends StatelessWidget {
  const KobantitarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
