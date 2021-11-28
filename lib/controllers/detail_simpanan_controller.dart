import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/models/simpanan.dart';
import 'package:kobantitar_mobile/ApiServices/service.dart';

class DetailSimpananController extends GetxController {
  var simpanan = Simpanan();
  var isLoaded = false.obs;
  var isSimpananLoaded = false.obs;
  final userData = GetStorage();
  String token = "";
  @override
  void onInit() {
    token = userData.read("token");
    getSimpanan();
    super.onInit();
  }

  void getSimpanan() async {
    final res = await Service.fetchSimpanan(token);
    if (res != null) {
      simpanan = res;
      isSimpananLoaded(true);
    }
    // print(list);
  }
}
