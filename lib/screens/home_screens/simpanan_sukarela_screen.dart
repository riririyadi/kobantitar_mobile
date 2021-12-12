import 'dart:convert';

import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/simpanan_sukarela_controller.dart';
import 'package:kobantitar_mobile/models/simpanan_sukarela.dart';
import 'package:kobantitar_mobile/screens/home_screens/ambil_simpanan_sukarela.dart';
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/screens/home_screens/history.dart';
import 'package:kobantitar_mobile/screens/home_screens/pengambilan.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SimpananSukarela extends StatefulWidget {
  const SimpananSukarela({Key? key}) : super(key: key);

  @override
  _SimpananSukarelaState createState() => _SimpananSukarelaState();
}

class _SimpananSukarelaState extends State<SimpananSukarela> {
  final SimpananSukarelaController controller =
      Get.put(SimpananSukarelaController());
  int _screen = 0;

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
                          'Simpanan Sukarela',
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
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Total Simpanan Sukarela',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rp  ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0),
                            ),
                            Obx(() {
                              if (controller.isLoaded.value) {
                                return Text(
                                  '${currencyFormatter.format(controller.simpanan.sukarela)}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24.0),
                                );
                              } else {
                                return Text("Loading",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24.0));
                              }
                            }),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => Get.to(() => AmbilSimpananSukarela(),
                                  arguments: controller.simpanan.sukarela),
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.swap_vert,
                                      color: Colors.white,
                                      size: 16.0,
                                    ),
                                    Text(
                                      "AMBIL SIMPANAN",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
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
              Positioned(
                  top: 187,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _screen = 0;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "HISTORY",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Container(
                              height: 4.0,
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                color: _screen == 0
                                    ? Color(0xff7C0A0A)
                                    : Colors.transparent,
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _screen = 1;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "PENGAMBILAN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Container(
                              height: 4.0,
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                color: _screen == 1
                                    ? Color(0xff7C0A0A)
                                    : Colors.transparent,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Positioned(
                top: 210,
                left: 0,
                right: 0,
                bottom: 0,
                child: _screen == 0 ? History() : Pengambilan(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
