import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/ApiServices/service.dart';
import 'package:kobantitar_mobile/models/me.dart';
import 'package:kobantitar_mobile/models/simpanan.dart';

class HomeController extends GetxController {
  dynamic argumentData = Get.arguments;
  var me = Me();
  var simpanan = Simpanan();
  var isLoaded = false.obs;
  var isSimpananLoaded = false.obs;
  final userData = GetStorage();
  String token = "";

  @override
  void onInit() {
    token = userData.read("token");

    Future.delayed(Duration(seconds: 2), () {
      // 5 seconds over, navigate to Page2.

      getMe();
      getSimpanan();
    });

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getMe() async {
    final resMe = await Service.fetchMe(token);
    if (resMe != null) {
      me = resMe;
      print(resMe);
      isLoaded(true);
    }
    // print(list);
  }

  void getSimpanan() async {
    final resSimp = await Service.fetchSimpanan(token);
    if (resSimp != null) {
      simpanan = resSimp;
      print(resSimp);
      isSimpananLoaded(true);
    }
  }
}
