import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:kobantitar_mobile/screens/home_screens/ambil_simpanan_sukarela.dart';

class SimpananSukarela extends StatefulWidget {
  const SimpananSukarela({Key? key}) : super(key: key);

  @override
  _SimpananSukarelaState createState() => _SimpananSukarelaState();
}

class _SimpananSukarelaState extends State<SimpananSukarela> {
  int _screen = 0;

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
                            Text(
                              '90.000.000',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.0),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  Get.to(() => AmbilSimpananSukarela()),
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
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Theme.of(context).dividerColor),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Menampilkan 12 dari 90',
                              style: TextStyle(fontSize: 12.0),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.download,
                                  color: Colors.green,
                                  size: 12.0,
                                ),
                                Text(
                                  'DOWNLOAD',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        child: ListView.builder(
                            itemCount: 15,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color:
                                              Theme.of(context).dividerColor)),
                                ),
                                child: Row(children: [
                                  Icon(Icons.verified_sharp,
                                      color: Colors.green),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Simpanan Wajib 2021",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "06 Okt 2021",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    "+Rp100.000",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ]),
                              );
                            }),
                      ),
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
}
