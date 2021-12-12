import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/splash_screen_controller.dart';

import 'auth_screens/halaman_pin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return KobantitarScreen(
        child: Scaffold(
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
    ));
  }
}

class KobantitarScreen extends StatelessWidget {
  final Widget child;

  const KobantitarScreen({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
        debounceDuration: Duration.zero,
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          if (connectivity == ConnectivityResult.none) {
            return NoConnectionScreen();
          }
          return child;
        },
        child: child);
  }
}

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xffC04C4C), Color(0xffF37F7F)])),
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/kobantitar-logo.png',
                  width: 100.0,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 40.0),
                Icon(
                  Icons.cloud_off,
                  color: Colors.white60,
                  size: 80.0,
                ),
                const SizedBox(height: 24.0),
                const Text(
                  "Anda tidak terkoneksi",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
                const SizedBox(height: 24.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "Anda tidak terkoneksi dengan jaringan internet, mohon periksa koneksi internet anda dan kembali lagi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      height: 2,
                      fontSize: 14,
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
