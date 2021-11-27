import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/models/me.dart';
import 'package:kobantitar_mobile/models/simpanan.dart';
import 'package:kobantitar_mobile/services/service.dart';

class HomeController extends GetxController {
  dynamic argumentData = Get.arguments;
  var me = Me();
  var simpanan = Simpanan();
  var isLoaded = false.obs;
  var isSimpananLoaded = false.obs;

  @override
  void onInit() {
    print(argumentData);
    Future.delayed(Duration(seconds: 2), () async {
      if (argumentData != null) {
        getMe();
        getSimpanan();
      }
    });

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getMe() async {
    final res = await Service.fetchMe(argumentData);
    if (res != null) {
      me = res;
      isLoaded(true);
    }
    // print(list);
  }

  void getSimpanan() async {
    final res = await Service.fetchSimpanan(argumentData);
    if (res != null) {
      simpanan = res;
      isSimpananLoaded(true);
    }
    // print(list);
  }
}
