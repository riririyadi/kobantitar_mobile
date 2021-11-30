import 'package:get/get.dart';

class PromoKobmartController extends GetxController {
  dynamic argumenData = Get.arguments;
  String imageUrl = "";

  @override
  void onInit() {
    imageUrl = argumenData;
    super.onInit();
  }
}
