import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/detail_simpanan_controller.dart';
import 'package:kobantitar_mobile/screens/home_screens/simpanan_pokok.dart';
import 'package:kobantitar_mobile/screens/home_screens/simpanan_sukarela_screen.dart';
import 'package:kobantitar_mobile/screens/home_screens/simpanan_wajib.dart';

class DetailSimpanan extends StatefulWidget {
  const DetailSimpanan({Key? key}) : super(key: key);

  @override
  _DetailSimpananState createState() => _DetailSimpananState();
}

class _DetailSimpananState extends State<DetailSimpanan> {
  final DetailSimpananController controller =
      Get.put(DetailSimpananController());
  final currencyFormatter = NumberFormat('#,##0', 'ID');
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
                        Text(
                          'Detail Simpanan',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 20,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Simpanan',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 10.0),
                      ),
                      SizedBox(height: 10.0),
                      Obx(() {
                        if (controller.isSimpananLoaded.value) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rp  ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0),
                              ),
                              Text(
                                '${currencyFormatter.format(controller.simpanan.total)}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24.0),
                              ),
                            ],
                          );
                        } else {
                          return Text("Loading...");
                        }
                      }),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 150,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24),
                    ),
                  ),
                  child: Container(
                    child: ListView(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 0,
                        bottom: 0,
                        right: 0,
                      ),
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(() => SimpananPokok()),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              height: 108,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 67,
                                          width: 72,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/investment.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Simpanan Pokok",
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(height: 10.0),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Rp   ",
                                                  style: TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Obx(() {
                                                  if (controller
                                                      .isSimpananLoaded.value) {
                                                    return Text(
                                                      "${currencyFormatter.format(controller.simpanan.pokok)}",
                                                      style: TextStyle(
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    );
                                                  } else {
                                                    return Text(
                                                      "Loading...",
                                                      style: TextStyle(
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    );
                                                  }
                                                })
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            Get.to(() => SimpananPokok()),
                                        child: Container(
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
                                            'Lihat Rincian',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9.0,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => SimpananWajib()),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              height: 108,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 67,
                                          width: 72,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/investment.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Simpanan Wajib",
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(height: 10.0),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Rp   ",
                                                  style: TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Obx(() {
                                                  if (controller
                                                      .isSimpananLoaded.value) {
                                                    return Text(
                                                      "${currencyFormatter.format(controller.simpanan.wajib)}",
                                                      style: TextStyle(
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    );
                                                  } else {
                                                    return Text(
                                                      "Loading...",
                                                      style: TextStyle(
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    );
                                                  }
                                                })
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
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
                                            color:
                                                Colors.black.withOpacity(0.28),
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                            )),
                                        child: Text(
                                          'Lihat Rincian',
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
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => SimpananSukarela(),
                              arguments: controller.simpanan.sukarela),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              height: 108,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 67,
                                          width: 72,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/investment.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Simpanan Sukarela",
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(height: 10.0),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Rp   ",
                                                  style: TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Obx(() {
                                                  if (controller
                                                      .isSimpananLoaded.value) {
                                                    return Text(
                                                      "${currencyFormatter.format(controller.simpanan.sukarela)}",
                                                      style: TextStyle(
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    );
                                                  } else {
                                                    return Text(
                                                      "Loading...",
                                                      style: TextStyle(
                                                          fontSize: 24.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    );
                                                  }
                                                })
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
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
                                            color:
                                                Colors.black.withOpacity(0.28),
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                            )),
                                        child: Text(
                                          'Lihat Rincian',
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
