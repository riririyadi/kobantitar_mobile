import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/kontak.dart';
import 'package:url_launcher/url_launcher.dart';

class KontakController extends GetxController {
  ContactUrl? kontak = ContactUrl();
  FaqUrl? faq = FaqUrl();
  final userData = GetStorage();
  String token = "";

  @override
  void onInit() {
    token = userData.read("token");
    super.onInit();
    getKontak();
  }

  void getKontak() async {
    final data = await Service.fetchKontak(token);
    if (data != null) {
      faq = data.data!.faqUrl;
      kontak = data.data!.contactUrl;
    }
  }

  Future openKontak(String uri) async {
    if (await canLaunch(uri)) {
      await launch(uri);
    }
  }

  Future openLink(String uri) async {
    if (await canLaunch(uri)) {
      await launch(uri,
          forceWebView: true, forceSafariVC: true, enableJavaScript: true);
    }
  }
}
