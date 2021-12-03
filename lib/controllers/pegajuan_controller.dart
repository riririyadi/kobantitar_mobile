import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/pengajuan.dart';
import 'package:kobantitar_mobile/models/tagihan.dart';

class PengajuanController extends GetxController {
  var isLoading = false.obs;
  final userData = GetStorage();
  String token = "";
  List<DataPengajuan>? pengajuanList = [];
  List<DataPengajuan>? pengajuanLogamMulia = [];
  List<DataPengajuan>? pengajuanKreditBarang = [];
  List<DataPengajuan>? pengajuanKreditKendaraan = [];
  List<DataPengajuan>? pengajuanKobmart = [];

  @override
  void onInit() {
    super.onInit();
    token = userData.read("token");
    getPengajuan();
  }

  void getPengajuan() async {
    try {
      isLoading(true);
      final data = await Service.fetchPengajuan(token);
      if (data != null) {
        pengajuanList = data.data;

        pengajuanLogamMulia = data.data!
            .where((pengajuan) => pengajuan.type!.endsWith("LM"))
            .toList();
        pengajuanKreditBarang = data.data!
            .where((pengajuan) => pengajuan.type!.endsWith("KB"))
            .toList();
        pengajuanKreditKendaraan = data.data!
            .where((pengajuan) => pengajuan.type!.endsWith("KK"))
            .toList();
        pengajuanKobmart = data.data!
            .where((pengajuan) => pengajuan.type!.endsWith("KM"))
            .toList();
      }
    } finally {
      isLoading(false);
    }
  }
}
