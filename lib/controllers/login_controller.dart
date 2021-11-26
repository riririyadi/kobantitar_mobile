import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/models/nomor_anggota.dart';
import 'package:kobantitar_mobile/models/user_token.dart';
import 'package:kobantitar_mobile/screens/auth_screens/daftar_akun_baru.dart';
import 'package:kobantitar_mobile/screens/home_screen.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isLoading2 = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nomorAnggotaController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nomorAnggotaController.dispose();
    super.onClose();
  }

  Future<UserToken?> checkUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://backend.kobantitar.com/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      Get.to(() => HomeScreen());
      return UserToken.fromJson(jsonDecode(response.body));
    } else {
      Get.snackbar("Login Failed", "Invalid email or address");
      return null;
    }
  }

  void printData(String email, String password) {
    print(email);
    print(password);
  }

  Future<NomorAnggota?> checkNomorAnggota(int nomorAnggota) async {
    final response = await http.get(
      Uri.parse(
          "https://backend.kobantitar.com/api/register/nomor-anggota/${nomorAnggota}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = jsonEncode(json['data']);
      print(data);
      return nomorAnggotaFromJson(data);
    } else if (response.statusCode == 401) {
      final json = jsonDecode(response.body);
      final data = json['data'];
      print(data);
      Get.off(() => DaftarAkunBaru(), arguments: data);
      return null;
    } else if (response.statusCode == 402) {
      final json = jsonDecode(response.body);
      final data = json['data'];
      print(data);
      Get.off(() => DaftarAkunBaru(), arguments: data);
      return null;
    } else {
      Get.back();
      Get.snackbar("Error", "Nomor Anggota tidak terdaftar");
      return null;
    }
  }
}
