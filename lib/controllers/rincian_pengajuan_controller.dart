import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/api_services/service.dart';
import 'package:kobantitar_mobile/models/detail_pengajuan.dart';
import 'package:kobantitar_mobile/models/pengajuan.dart';
import 'package:kobantitar_mobile/models/tagihan.dart';
import 'package:kobantitar_mobile/screens/pengajuan_screens/detail_pengajuan.dart';

class RincianPengajuanController extends GetxController {
  dynamic argumentData = Get.arguments;
  var isLoading = false.obs;
  final userData = GetStorage();
  String token = "";
  var rincianPengajuan = DetailDataPengajuan();
  var pengajuan = Pengajuan();
  var riwayatPengajuan = <Riwayat>[];
  var riwayatTagihan = <Tagihan>[];

  @override
  void onInit() {
    super.onInit();
    print(argumentData);
    token = userData.read("token");
    getDetailPengajuan();
  }

  void getDetailPengajuan() async {
    try {
      isLoading(true);
      final data =
          await Service.fetchDetailPengajuan(token, argumentData['id']);
      if (data != null) {
        rincianPengajuan = data;
        riwayatPengajuan = data.data!.riwayat!;
        pengajuan = data.data!.pengajuan!;
        riwayatTagihan = data.data!.tagihan!;
      }
    } finally {
      isLoading(false);
    }
  }
}
