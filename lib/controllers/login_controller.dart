import 'dart:convert';
import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/models/nomor_anggota.dart';
import 'package:kobantitar_mobile/screens/auth_screens/buat_pin.dart';
import 'package:kobantitar_mobile/screens/auth_screens/daftar_akun_baru.dart';
import 'package:kobantitar_mobile/api_config/config.dart' as config;
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/screens/components/webview.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isLoading2 = false.obs;
  final userData = GetStorage();
  var jenisPendaftaran = "";

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nomorAnggotaController = TextEditingController();
  final lupaPasswordUri = "https://backend.kobantitar.com/password/reset";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future openLink() async {
    if (await canLaunch(lupaPasswordUri)) {
      Get.to(KobantitarWebview(judul: "Lupa Password", url: lupaPasswordUri));
    }
  }

  Future<String?> checkUser(String email, String password) async {
    final response = await http.post(
      Uri.parse("${config.baseURL}/login"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final token = json['data']['token'];
      final role = json['data']['role'];
      userData.write("token", token);
      userData.write("role", role);

      // If User Authenticated Get FCM TOKEN
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      await postDevice(token, fcmToken!);

      Get.offAll(() => BuatPIN());
      return token;
    } if(response.statusCode == 401){
      final json = jsonDecode(response.body);
       Get.snackbar(
        'Tidak bisa masuk',
        json["data"]["message"],
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.yellow.shade900,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    } else {
      Get.snackbar(
        'Password Salah',
        "Username / Password yang anda masukkan salah",
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
      return null;
    }
  }

  Future<NomorAnggota?> checkNomorAnggota(int nomorAnggota) async {
    final response = await http.get(
      Uri.parse("${config.baseURL}/register/nomor-anggota/${nomorAnggota}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = jsonEncode(json['data']);

      var nomorAnggotaData = nomorAnggotaFromJson(data);
      Get.off(() => DaftarAkunBaru(),
          arguments: [nomorAnggota.toString(), "LAMA", nomorAnggotaData]);
    } else if (response.statusCode == 401) {
      final json = jsonDecode(response.body);
      final data = json['data'];
      print(data);
      Get.back();
      Get.snackbar("Error", data['message']);
      return null;
    } else {
      Get.back();
      Get.snackbar("Error", "Nomor Anggota tidak terdaftar");
      return null;
    }
  }

  Future<String?> postDevice(String token, String fcmToken) async {
    final response = await http.post(Uri.parse("${config.baseURL}/devices"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'token': fcmToken,
        }));
    if (response.statusCode == 200) {
      print("Post Device OK");
      return "Post Device Ok";
    } else {
      return "";
    }
  }
}
