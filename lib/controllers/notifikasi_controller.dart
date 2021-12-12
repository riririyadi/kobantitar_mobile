import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/notifikasi.dart';
import 'package:kobantitar_mobile/api_config/config.dart' as config;
import 'package:http/http.dart' as http;

class NotifikasiController extends GetxController {
  var isLoaded = false.obs;
  String token = "";
  final userData = GetStorage();
  var notifikasi = <NotifikasiData>[];

  @override
  void onInit() {
    token = userData.read('token');
    super.onInit();
    getNotifikasi();
  }

  void getNotifikasi() async {
    final data = await Service.fetchNotifikasi(token);
    if (data != null) {
      notifikasi = data.data!;
      isLoaded(true);
    }
  }

  Future<String?> deleteNotifikasi(String id) async {
    final response = await http.delete(
      Uri.parse("${config.baseURL}/notification?id=$id"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      Get.snackbar("Yeah", "the notification deleted successfully");
      getNotifikasi();
      return "OK";
    } else {
      return null;
    }
  }
}
