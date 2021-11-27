import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:kobantitar_mobile/screens/splash_screen.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
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
