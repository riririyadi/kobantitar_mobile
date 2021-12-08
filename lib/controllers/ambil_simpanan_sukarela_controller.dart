import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/api_config/config.dart' as config;

class AmbilSimpananSukarelaController extends GetxController {
  var nominalController = TextEditingController();
  final nominalFormKey = GlobalKey<FormState>();
  dynamic argumenData = Get.arguments;

  final userData = GetStorage();
  late String token;
  RxInt sisa = 0.obs;

  @override
  void onInit() {
    sisa(argumenData);
    token = userData.read("token");
    nominalController.addListener(() {
      print(argumenData);
     
      var nominal = int.tryParse(nominalController.text.replaceAll(".", ""));
      if(nominal != null){
        var sisaNew = sisa.value - nominal;
        if(sisaNew < 0){
           Get.snackbar(
              'Nominal Melebihi',
              "Nominal yang anda masukkan melebihi simpanan anda",
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
            sisa(argumenData);
            nominalController.text = "";
        }else{
          sisa(sisaNew);

        }
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    nominalController.dispose();
    super.onInit();
  }

  Future<String?> postAjukanPengambilan(int nominal) async {
    final response = await http.post(
      Uri.parse("${config.baseURL}/simpanan/sukarela/pengambilan"),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{'nominal': nominal}),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final id = jsonEncode(json['data']['id']);
      print(id);

      return id;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
