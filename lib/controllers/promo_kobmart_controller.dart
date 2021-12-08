import 'package:get/get.dart';

class PromoKobmartController extends GetxController {
  dynamic argumenData = Get.arguments;
  String imageUrl = "";

  @override
  void onInit() {
    print(Get.arguments);
    imageUrl = argumenData ?? "";
    super.onInit();
  }
}
