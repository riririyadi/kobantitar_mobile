import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_config/config.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/screens/auth_screens/buat_pin.dart';
import 'package:kobantitar_mobile/screens/auth_screens/halaman_pin.dart';
import 'package:kobantitar_mobile/screens/auth_screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/screens/splash_screen.dart';

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
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
    Timer(const Duration(seconds: 2), () async {
      try{
        await Service.fetchSetting();
      }catch(e){
        Get.off(() => const NoConnectionScreen());
      }
      if (token == null) {
        Get.off(() => LoginScreen());
      } else {
        // If User Authenticated Get FCM TOKEN
        String? token = await FirebaseMessaging.instance.getToken();
        await storeDeviceToken(token!);
        Get.off(() => HalamanPIN());
      }
    });
  }

  Future<void> storeDeviceToken(String fcmToken) async {
    String token = await GetStorage().read('token');
    final response = await http.post(Uri.parse(baseURL + "/devices"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'token': fcmToken,
        }));
    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Error Post Data');
    }
  }
}
