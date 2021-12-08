import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/logam_mulia_configuration.dart';

class PengajuanLogamMuliaController extends GetxController {
  var tglPembayaranController = TextEditingController();
  var amountIdController = TextEditingController();
  final userData = GetStorage();
  late String token;
  List<Amount>? amountList = <Amount>[].obs;
  List<int>? featuredAmountIds = <int>[].obs;
  List<Amount>? featuredAmountList = <Amount>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    token = userData.read("token");
    print("ini adalah amout " + amountIdController.text);
    getPengajuanLogamMuliaConfig();
    super.onInit();
  }

  @override
  void onClose() {
    amountIdController.dispose();

    super.onInit();
  }

  void getPengajuanLogamMuliaConfig() async {
    try {
      isLoading(true);
      final res = await Service.fetchPengajuanLogamMuliaConfig(token);
      print(res?.data);
      if (res != null) {
        amountList = res.data!.amounts;
        featuredAmountIds = res.data!.featuredAmountIds;
        featuredAmountList = amountList?.where((element) => featuredAmountIds!.contains(element.id)).toList();
        print(featuredAmountList);
      }
    } finally {
      isLoading(false);
    }
  }
}
