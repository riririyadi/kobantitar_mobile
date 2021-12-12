import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/rincian_pengajuan_controller.dart';
import 'package:kobantitar_mobile/screens/pengajuan_screens/detail_pengajuan.dart';
import 'package:kobantitar_mobile/screens/pengajuan_screens/riwayat_tagihan.dart';

class RincianPengajuan extends StatefulWidget {
  const RincianPengajuan({Key? key}) : super(key: key);

  @override
  _RincianPengajuanState createState() => _RincianPengajuanState();
}

class _RincianPengajuanState extends State<RincianPengajuan>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(RincianPengajuanController());
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  int _jenisRincian = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffEE6A6A),
                Color(0xffC30707),
                Color(0xfff8f8f8),
                Color(0xfff8f8f8)
              ]),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 20,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 14.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        textDetail(controller.argumentData['type'])
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xfff8f8f8),
                    ),
                    child: Obx(() {
                      if (controller.isLoading.isTrue) {
                        return Container(
                          height: MediaQuery.of(context).size.height - 160,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      return Container(
                        height: controller.riwayatTagihan.length * 88 + 160,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 16.0, 8.0),
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 7.0,
                                      spreadRadius: 1.0,
                                      offset: const Offset(
                                          0.0, 5.0), // shadow direction: bottom
                                    )
                                  ],
                                ),
                                child: TabBar(
                                  controller: _tabController,
                                  // give the indicator a decoration (color and border radius)
                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        25.0,
                                      ),
                                      // color: Colors.green,
                                      gradient: const LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            Color(0xffC04C4C),
                                            Color(0xffF37F7F)
                                          ])),
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.black,
                                  tabs: const [
                                    Tab(text: 'Detail'),
                                    Tab(text: 'Riwayat Tagihan'),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                physics: NeverScrollableScrollPhysics(),
                                controller: _tabController,
                                children: const [
                                  DetailPengajuan(),
                                  RiwayatTagihan()
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textDetail(String tipePengajuan) {
    if (tipePengajuan == "LM") {
      return const Text(
        'Transaksi Logam Mulia',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      );
    } else if (tipePengajuan == "KB") {
      return const Text(
        'Transaksi Kredit Barang',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      );
    } else if (tipePengajuan == "KK") {
      return const Text(
        'Transaksi Kredit Kendaraan',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      );
    } else {
      return const Text(
        'Transaksi Kobmart',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      );
    }
  }
}
