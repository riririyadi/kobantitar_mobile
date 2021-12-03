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

class _RincianPengajuanState extends State<RincianPengajuan> {
  final controller = Get.put(RincianPengajuanController());
  int _jenisRincian = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffEE6A6A), Color(0xffC30707)]),
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
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff8f8f8),
                  ),
                  child: ListView(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 7.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 5.0), // shadow direction: bottom
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _jenisRincian = 0;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: _jenisRincian == 0
                                        ? BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.centerRight,
                                                end: Alignment.centerLeft,
                                                colors: [
                                                  Color(0xffFCB3B3),
                                                  Color(0xffFF4D4D)
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          )
                                        : BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                    child: Center(
                                      child: Text(
                                        "Detail",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: _jenisRincian == 0
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _jenisRincian = 1;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: _jenisRincian == 1
                                        ? BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.centerRight,
                                                end: Alignment.centerLeft,
                                                colors: [
                                                  Color(0xffFCB3B3),
                                                  Color(0xffFF4D4D)
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          )
                                        : BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                    child: Center(
                                      child: Text(
                                        "Riwayat Tagihan",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: _jenisRincian == 1
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _jenisRincian == 0 ? DetailPengajuan() : RiwayatTagihan(),
                    ],
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
      return Text(
        'Transaksi Logam Mulia',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      );
    } else if (tipePengajuan == "KB") {
      return Text(
        'Transaksi Kredit Barang',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      );
    } else if (tipePengajuan == "KK") {
      return Text(
        'Transaksi Kredit Kendaraan',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      );
    } else {
      return Text(
        'Transaksi Kobmart',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      );
    }
  }
}
