import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/laporan.dart';
import 'package:kobantitar_mobile/screens/home_screens/laporan_keuangan_view_document.dart';

class LaporanKeuanganController extends GetxController {
  String token = "";
  final userData = GetStorage();
  Laporan laporan = Laporan();

  @override
  void onInit() {
    token = userData.read('token');
    super.onInit();
  }

  void getLaporanTahunan(String tahun) async {
    final data = await Service.fetchLaporanTahunan(token, tahun);
    if (data != null) {
      laporan = data;
      Get.to(() => ViewDocument(), arguments: laporan.laporanUrl);
    }
  }

  void getLaporanBulanan(String tahun, String bulan) async {
    final data = await Service.fetchLaporanBulanan(token, tahun, bulan);
    if (data != null) {
      laporan = data;
      Get.to(() => ViewDocument(), arguments: laporan.laporanUrl);
    }
  }
}
