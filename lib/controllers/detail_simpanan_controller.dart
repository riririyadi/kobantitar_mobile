import 'package:get/get.dart';
import 'package:kobantitar_mobile/models/simpanan.dart';
import 'package:kobantitar_mobile/services/service.dart';

class DetailSimpananController extends GetxController {
  var simpanan = Simpanan();
  var isLoaded = false.obs;
  var isSimpananLoaded = false.obs;

  var token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NGYzNmFkZC1hZmY4LTRkZDMtYWM5Yy04N2RkYTc3NzM0NTIiLCJqdGkiOiI0MTRiMGQ1MmNlOTQ5MWUzZDE3MDFiZDYwYjExMTIwNzIxZGJhYzI5OWUwNDQwZjk3MDEwZDAxNWVkZjZkZWUxMTNlZmRhYTJhODgxZTE1MSIsImlhdCI6MTYzNzg3NTI2NC40NjYwNzcsIm5iZiI6MTYzNzg3NTI2NC40NjYwOCwiZXhwIjoxNjY5NDExMjY0LjQ2MDczMywic3ViIjoiMSIsInNjb3BlcyI6W119.HGZoYbKpztC8NKaAQTt1ohoAnGbNbDChy7v4FpBgXq3g2POMV2F_Btawc7WvmsfA6T4sKNn7BOvA3m7u6hrsI4A7Wm9ACPqwAPJuzf3w6Lje9eYbcEyfd_ryANR1KrU_iH1HfTyy-QYU4XDPfJTVC63lwaavOxpLYKvP_yCe7NWFDMjcOqPoSSkeYSQtO88FFqZ5RxyC5gVoRqQ_3OmqN9ki1o39pAdW3xLQ3zoSwiZNhpIgOkL7VvE-P5UWcpBL_fRCCqm3N7ZRkbdir3E_XguiHkyTcoL06RWCi4HIS2PBzojt05SDKFVlHuZYqGvyYTeg27jcweKDdwdzijJsoZWIMV4K9m84opXZ_K4fPOn_uvtAiZ9mDd3_caPgfHseTBswAOeCtNfgGlcUgttL1kBlpceWckCTo8bMYP07v3DdpEbRQTDTbdbt47H9dqpuJClI6janfXKcnTHMd5yLcsiUWrWAovy9sa_AQkFMRGthfECJM9esWHldcToKdOMx7DQMXEXTGtYt27WvCz9-nAwberGGwP1tKvRPt0R4S_daXtC8Iz1B1FeDkyaBrhgVHkXM1BvGdawLDOm1qErX3O4a8omQ-BxJ9GUmiuFKVQ2zZyQ7XcahZA-j5J0NQ0Pgyu21ViYisrSKPIo8NliL2ygQFsUjb0Wr8F5LOLhBg_I';

  @override
  void onInit() {
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
