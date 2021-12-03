import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/models/nomor_anggota.dart';
import 'package:kobantitar_mobile/screens/auth_screens/daftar_akun_baru.dart';
import 'package:kobantitar_mobile/api_config/config.dart' as config;
import 'package:http/http.dart' as http;
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
    emailController.text = "rizqymulyana@kobantitar.com";
    passwordController.text = "rizqy1234";
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future openLink() async {
    if (await canLaunch(lupaPasswordUri)) {
      await launch(lupaPasswordUri,
          forceWebView: true, forceSafariVC: true, enableJavaScript: true);
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
      postDevice(token);
      return token;
    } else {
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

      return nomorAnggotaFromJson(data);
    } else if (response.statusCode == 401) {
      final json = jsonDecode(response.body);
      final data = json['data'];
      Get.off(() => DaftarAkunBaru(),
          arguments: [nomorAnggota.toString(), "Anggota lama"]);
      return null;
    } else if (response.statusCode == 402) {
      final json = jsonDecode(response.body);
      final data = json['data'];
      Get.off(() => DaftarAkunBaru(), arguments: data);
      return null;
    } else {
      Get.back();
      Get.snackbar("Error", "Nomor Anggota tidak terdaftar");
      return null;
    }
  }

  Future<String?> postDevice(String token) async {
    final response = await http.post(Uri.parse("${config.baseURL}/devices"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'token': token,
        }));
    if (response.statusCode == 200) {
      print("Post Device OK");
      return "Post Device Ok";
    } else {
      return "";
    }
  }
}
