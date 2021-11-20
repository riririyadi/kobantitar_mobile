import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:kobantitar_mobile/screens/auth_screens/data_pribadi.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/pendaftaran_sukses.dart';

import 'data_pribadi.dart';
import 'detail_akun.dart';
import 'detail_bank.dart';
import 'dokumen.dart';

class DaftarAkunBaru extends StatefulWidget {
  const DaftarAkunBaru({Key? key}) : super(key: key);

  @override
  _DaftarAkunBaruState createState() => _DaftarAkunBaruState();
}

class _DaftarAkunBaruState extends State<DaftarAkunBaru> {
  int _step = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(children: [
            Positioned(
              left: 0,
              bottom: 0,
              top: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xffEE6A6A), Color(0xffC30707)]),
                ),
                child: Container(
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
                            Text(
                              "Daftar Akun",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
            Positioned(
              top: 72,
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 50.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: _step >= 0
                                    ? Color(0xffE54444)
                                    : Color(0xffe0e0e0),
                                child: Icon(Icons.person,
                                    size: 12.0, color: Colors.white),
                                radius: 14,
                              ),
                              SizedBox(width: 5.0),
                              Text("Data Pribadi",
                                  style: TextStyle(fontSize: 10.0)),
                              SizedBox(width: 5.0),
                              Container(
                                height: 2,
                                width: 30,
                                decoration: _step >= 1
                                    ? BoxDecoration(color: Color(0xffE54444))
                                    : BoxDecoration(color: Color(0xffe0e0e0)),
                              ),
                              SizedBox(width: 5.0),
                              CircleAvatar(
                                backgroundColor: _step >= 1
                                    ? Color(0xffE54444)
                                    : Color(0xffe0e0e0),
                                child: Icon(Icons.home,
                                    size: 12.0, color: Colors.white),
                                radius: 14,
                              ),
                              SizedBox(width: 5.0),
                              Text("Detail Bank",
                                  style: TextStyle(fontSize: 10.0)),
                              SizedBox(width: 5.0),
                              Container(
                                height: 2,
                                width: 30,
                                decoration: _step >= 2
                                    ? BoxDecoration(color: Color(0xffE54444))
                                    : BoxDecoration(color: Color(0xffe0e0e0)),
                              ),
                              SizedBox(width: 5.0),
                              CircleAvatar(
                                backgroundColor: _step >= 2
                                    ? Color(0xffE54444)
                                    : Color(0xffe0e0e0),
                                child: Icon(Icons.lock,
                                    size: 12.0, color: Colors.white),
                                radius: 14,
                              ),
                              SizedBox(width: 5.0),
                              Text("Detail Akun",
                                  style: TextStyle(fontSize: 10.0)),
                              SizedBox(width: 5.0),
                              Container(
                                height: 2,
                                width: 30,
                                decoration: _step >= 3
                                    ? BoxDecoration(color: Color(0xffE54444))
                                    : BoxDecoration(color: Color(0xffe0e0e0)),
                              ),
                              SizedBox(width: 5.0),
                              CircleAvatar(
                                backgroundColor: _step >= 3
                                    ? Color(0xffE54444)
                                    : Color(0xffe0e0e0),
                                child: Icon(Icons.document_scanner,
                                    size: 12.0, color: Colors.white),
                                radius: 14,
                              ),
                              SizedBox(width: 5.0),
                              Text("Dokumen", style: TextStyle(fontSize: 10.0)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: IndexedStack(
                        index: _step,
                        children: [
                          DataPribadi(),
                          DetailBank(),
                          DetailAkun(),
                          Dokumen(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {
                          if (_step < 3) {
                            setState(() {
                              _step += 1;
                            });
                          } else {
                            Get.to(() => PendaftaranSukses());
                          }
                        },
                        child: Container(
                          height: 48.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xff851212), Color(0xffFF8A8A)]),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 1.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    0.0, 4.0), // shadow direction: bottom
                              )
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "Selanjutnya",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
