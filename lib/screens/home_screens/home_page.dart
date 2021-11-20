import "package:flutter/material.dart";
import 'package:kobantitar_mobile/screens/home_screens/kobantitar_mart.dart';
import 'package:kobantitar_mobile/screens/home_screens/laporan_keuangan.dart';
import 'package:kobantitar_mobile/screens/home_screens/pengajuan_kredit_barang.dart';
import 'package:kobantitar_mobile/screens/home_screens/pengajuan_kredit_barang_lain.dart';
import 'package:kobantitar_mobile/screens/home_screens/pengajuan_transaksi_logam_mulia.dart';
import 'package:kobantitar_mobile/screens/home_screens/simulasi_shu.dart';
import 'package:kobantitar_mobile/screens/home_screens/total_simpanan.dart';
import 'package:get/get.dart';

import 'notifications.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffEE6A6A),
            ),
          ),
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
              ),
            ),
          ),
          bottom: 0,
          left: 0,
          right: 0,
          top: 150,
        ),
        ListView(
          padding: const EdgeInsets.symmetric(vertical: 80.0),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff9A3A3A),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(0.0, 5.0), // shadow direction: bottom
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'RIZQI MULYANA',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '40128',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/kartu-anggota-qr.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'TOTAL SIMPANAN',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w600,
                                fontSize: 10.0,
                              ),
                            ),
                            Text(
                              'RP 100.000.000',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            GestureDetector(
                              onTap: () => Get.to(() => TotalSimpanan()),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  'LIHAT DETAIL',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.0,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 14.0),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24.0),
                  topLeft: Radius.circular(24.0),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 20.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  Get.to(() => PengajuanTransaksiLogamMulia()),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30.0,
                                    width: 30.0,
                                    child: Image(
                                      image:
                                          AssetImage('assets/gold-ingots.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Transaksi\nLogam Mulia',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 9.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _bottomSheet(context);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30.0,
                                    width: 30.0,
                                    child: Image(
                                      image: AssetImage('assets/wallet.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Kredit\nBarang',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 9.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.to(() => SimulasiSHU()),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30.0,
                                    width: 30.0,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/point-of-service.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Simulasi SHU',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 9.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.to(() => LaporanKeuangan()),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30.0,
                                    width: 30.0,
                                    child: Image(
                                      image:
                                          AssetImage('assets/presentation.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Laporan\nKeuangan',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 9.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.to(() => KobantitarMart()),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30.0,
                                    width: 30.0,
                                    child: Image(
                                      image: AssetImage('assets/store.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Kobantitar\nMart',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 9.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Informasi terbaru'),
                              Text(
                                'Lihat Semua',
                                style: TextStyle(
                                  color: Color(0xff9A3A3A),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    top: 8, bottom: 8, right: 10),
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xff009FD9),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20),
                                      child: Text(
                                        "Plafon Kredit Logam Mulia sampai dengan 20jt",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.28),
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(10),
                                                topLeft: Radius.circular(10),
                                              )),
                                          child: Text(
                                            'Ajukan Sekarang!',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9.0,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 26.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Promo menarik'),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xffFF3C3C), Color(0xffEDD715)]),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Promo Kobmart",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text("1-15 Sept 2021",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.0),
                                          textAlign: TextAlign.left),
                                    ],
                                  ),
                                  Text(
                                    'Lihat Semua',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4.2,
                                    height: 150.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4.2,
                                    height: 150.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4.2,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          height: 72,
          decoration: BoxDecoration(
            color: Color(0xffEE6A6A),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                        image: AssetImage('assets/kobantitar-logo.png'),
                        height: 72.0,
                        width: 100.0),
                    IconButton(
                        onPressed: () {
                          Get.to(() => Notifications());
                        },
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 32.0,
                        )),
                  ],
                ),
              ]),
        ),
      ],
    );
  }

  _bottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext c) {
          return Container(
            color: Color(0xff757575),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              height: 180,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Kategori',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  Get.off(() => PengajuanKreditBarang()),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xfff0f0f0),
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    child: Image(
                                      image: AssetImage('assets/scooter.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("Kendaraan"),
                          ],
                        ),
                        SizedBox(
                          width: 50.0,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  Get.to(() => PengajuanKreditBarangLain()),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xfff0f0f0),
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    child: Image(
                                      image: AssetImage('assets/device.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("Lainnya"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
