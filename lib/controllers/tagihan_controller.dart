import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/tagihan.dart';

class TagihanController extends GetxController {
  var isLoading = false.obs;
  final userData = GetStorage();
  String token = "";
  List<DataTagihan>? tagihanList = [];
  List<DataTagihan>? tagihanLogamMulia = [];
  List<DataTagihan>? tagihanKreditBarang = [];
  List<DataTagihan>? tagihanKreditKendaraan = [];
  List<DataTagihan>? tagihanKobmart = [];

  @override
  void onInit() {
    super.onInit();
    token = userData.read("token");
    getTagihan();
  }

  void getTagihan() async {
    try {
      isLoading(true);
      final data = await Service.fetchTagihan(token);
      if (data != null) {
        tagihanList = data.data;

        tagihanLogamMulia = data.data!
            .where((tagihan) => tagihan.type!.endsWith("LM"))
            .toList();
        tagihanKreditBarang = data.data!
            .where((tagihan) => tagihan.type!.endsWith("KB"))
            .toList();
        tagihanKreditKendaraan = data.data!
            .where((tagihan) => tagihan.type!.endsWith("KK"))
            .toList();
        tagihanKobmart = data.data!
            .where((tagihan) => tagihan.type!.endsWith("KM"))
            .toList();
      }
    } finally {
      isLoading(false);
    }
  }
}
