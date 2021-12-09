import "package:flutter/material.dart";
import 'package:kobantitar_mobile/api_config/config.dart' as config;

import 'package:kobantitar_mobile/controllers/home_controller.dart';
import 'package:kobantitar_mobile/screens/home_screens/kobantitar_mart_list_produk.dart';
import 'package:kobantitar_mobile/screens/home_screens/kobantitar_mart_search_list_produk.dart';
import 'package:kobantitar_mobile/screens/home_screens/laporan_keuangan.dart';
import 'package:kobantitar_mobile/screens/home_screens/pengajuan_kredit_kendaraan_merk_motor.dart';
import 'package:kobantitar_mobile/screens/home_screens/pengajuan_kredit_barang_lain.dart';
import 'package:kobantitar_mobile/screens/home_screens/pengajuan_transaksi_logam_mulia.dart';
import 'package:kobantitar_mobile/screens/home_screens/promo_kobmart.dart';
import 'package:kobantitar_mobile/screens/home_screens/simulasi_shu.dart';
import 'package:kobantitar_mobile/screens/home_screens/detail_simpanan.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'notifications.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final HomeController controller = Get.put(HomeController());

  final currencyFormatter = NumberFormat('#,##0', 'ID');

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
          padding: controller.role == "ANGGOTA"
              ? const EdgeInsets.only(top: 80, bottom: 80)
              : const EdgeInsets.only(top: 100, bottom: 80),
          children: [
            controller.role == "ANGGOTA" ? cardAnggota() : cardNonAnggota(),
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
                      child: controller.role == "ANGGOTA"
                          ? menuAnggota()
                          : menuNonAnggota(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    /** @change horizontal padding set zero */
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Column(
                      children: [
                        /** @change Added horiontal padding for header */
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Obx(() {
                            if (controller.isDashboardLoaded.value) {
                              return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Informasi terbaru'),
                                    Text(
                                      'Lihat Semua',
                                      style: TextStyle(
                                        color: Color(0xff9A3A3A),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ]);
                            } else {
                              return Text("");
                            }
                          }),
                        ),
                        Obx(() {
                          if (controller.isDashboardLoaded.value) {
                            return SizedBox(
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller
                                    .dashboard.data!.informasi!.length,
                                itemBuilder: (context, index) {
                                  final informasi = controller
                                      .dashboard.data!.informasi![index];
                                  return Container(
                                    margin: EdgeInsets.only(
                                      /** @change left margin for first item only */
                                      left: index == 0 ? 16 : 0,
                                      top: 8,
                                      bottom: 8,
                                      right: 10,
                                    ),
                                    width: 240,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.openLink(informasi.url!);
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.network(
                                            "https://backend.kobantitar.com${informasi.backgroundUrl}",
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return SizedBox(
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                      /** @change left margin for first item only */
                                      left: index == 0 ? 16 : 0,
                                      top: 8,
                                      bottom: 8,
                                      right: 10,
                                    ),
                                    width: 240,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                        })
                      ],
                    ),
                  ),
                  SizedBox(height: 26.0),
                  Obx(() {
                    if (controller.isDashboardLoaded.value) {
                      return Padding(
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
                                    colors: [
                                      Color(0xffFF3C3C),
                                      Color(0xffEDD715)
                                    ]),
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
                                      GestureDetector(
                                        onTap: () {
                                          print(controller
                                              .dashboard.data?.promoImageUrl);
                                          // return;
                                          Get.to(() => PromoKobmart(),
                                              arguments: controller.dashboard
                                                  .data?.promoImageUrl);
                                        },
                                        child: Text(
                                          'Lihat Semua',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10.0,
                                          ),
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
                                    children: promoProducts(),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Container(
                          height: 400, child: Center(child: Text("")));
                    }
                  }),
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

  Widget cardAnggota() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff9A3A3A),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0x967A2121),
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 6.0), // shadow direction: bottom
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
                      Obx(() {
                        if (controller.isLoaded.value) {
                          return Text('${controller.me.nama!.toUpperCase()}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ));
                        } else {
                          return Text("Loading...");
                        }
                      }),
                      /** @Change text color  */
                      Obx(() {
                        if (controller.isLoaded.value) {
                          return Text('${controller.me.nomorAnggota}',
                              style: TextStyle(
                                color: Colors.white38,
                                fontWeight: FontWeight.w600,
                              ));
                        } else {
                          return Text("Loading...");
                        }
                      }),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      _bottomSheetQRCode(context);
                    },
                    child: Container(
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
                              image: AssetImage('assets/kartu-anggota-qr.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    /** @Change text color  */
                    Text(
                      'TOTAL SIMPANAN',
                      style: TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.w600,
                        fontSize: 10.0,
                      ),
                    ),
                    Obx(() {
                      if (controller.isSimpananLoaded.value) {
                        return Text(
                          'RP ${currencyFormatter.format(controller.simpanan.total)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                        );
                      } else {
                        return Text("Loading...");
                      }
                    }),
                    SizedBox(
                      height: 5.0,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(
                        () => DetailSimpanan(),
                      ),
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
    );
  }

  Widget cardNonAnggota() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff9A3A3A),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0x967A2121),
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 6.0), // shadow direction: bottom
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
                        "SELAMAT DATANG,",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Obx(() {
                        if (controller.isLoaded.value) {
                          return Text(
                            '${controller.me.nama!.toUpperCase()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        } else {
                          return Text("Loading...");
                        }
                      }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuAnggota() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => Get.to(() => PengajuanTransaksiLogamMulia()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  child: Image(
                    image: AssetImage('assets/gold-ingots.png'),
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
                    image: AssetImage('assets/point-of-service.png'),
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
                    image: AssetImage('assets/presentation.png'),
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
            onTap: () => Get.to(() => KobantitarMartListProduk()),
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
    );
  }

  Widget menuNonAnggota() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GestureDetector(
            onTap: () => Get.to(() => PengajuanTransaksiLogamMulia()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  child: Image(
                    image: AssetImage('assets/gold-ingots.png'),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GestureDetector(
            onTap: () => Get.to(() => KobantitarMartSearchListProduk()),
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
    );
  }

  List<Widget> promoProducts() {
    List<Widget> list = [];

    for (int i = 0; i < controller.dashboard.data!.promoProducts!.length; i++) {
      final product = controller.dashboard.data!.promoProducts![i];
      list.add(Container(
        width: MediaQuery.of(context).size.width / 4.2,
        height: 150.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network("${config.baseURI}${product.imageUrl}"),
              Text(
                  "Rp ${currencyFormatter.format(product.hargaPromo).toString()}",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  )),
              Text(
                  "Rp ${currencyFormatter.format(product.hargaAwal).toString()}",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                  )),
            ],
          ),
        ),
      )); //add any Widget in place of Text("Index $i")
    }
    return list; // all widget added now retrun the list here
  }

  _bottomSheetQRCode(context) {
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
                child: Container(
                  height: 120,
                  width: 120,
                  child: Image(
                    image: AssetImage('assets/kartu-anggota-qr.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
