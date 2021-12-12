import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/informasi.dart';
import 'package:kobantitar_mobile/screens/components/webview.dart';
import 'package:url_launcher/url_launcher.dart';

class InformasiController extends GetxController {
  var isInformasiLoaded = false.obs;
  String token = "";
  final userData = GetStorage();
  Informasi informasi = Informasi();

  @override
  void onInit() {
    token = userData.read('token');
    // TODO: implement onInit
    super.onInit();
    getInformasi();
  }

  void getInformasi() async {
    final data = await Service.fetchInformasi(token);
    if (data != null) {
      informasi = data;
      isInformasiLoaded(true);
    }
  }

  Future openLink(String uri) async {
    if (await canLaunch(uri)) {
      Get.to(() => KobantitarWebview(judul: "Informasi Terbaru", url: uri));
    }
  }
}
