import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/screens/home_screens/laporan_keuangan_view_document.dart';

class LaporanKeuangan extends StatefulWidget {
  const LaporanKeuangan({Key? key}) : super(key: key);

  @override
  _LaporanKeuanganState createState() => _LaporanKeuanganState();
}

class _LaporanKeuanganState extends State<LaporanKeuangan> {
  final items = ['2010', '2011', '2012', '2013', '2014', '2015'];
  final anotherItems = [
    'Januari 2019',
    'Februari 2019',
    'Maret 2019',
    'April 2019',
    'Mei 2019',
    'Juni 2019'
  ];

  String pathPDF = "";
  String landscapePathPdf = "";
  String remotePDFpath = "";
  String corruptedPathPDF = "";

  @override
  void initState() {
    super.initState();

    createFileOfPdfUrl().then((f) {
      setState(() {
        remotePDFpath = f.path;
      });
    });
  }

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
      // final url = "https://pdfkit.org/docs/guide.pdf";
      final url = "http://www.pdf995.com/samples/pdf.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

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
                          'Laporan Keuangan',
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
                top: 60,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff8f8f8),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 8.0),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () {
                            _monthPicker(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 32.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xff851212),
                                    Color(0xffFF8A8A)
                                  ]),
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
                            child: Text(
                              "Laporan Bulanan",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                        child: GestureDetector(
                          onTap: () {
                            _yearPicker(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 32.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xff851212),
                                    Color(0xffFF8A8A)
                                  ]),
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
                            child: Text(
                              "Laporan Tahunan",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
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

  _yearPicker(context) {
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
              height: 260,
              child: Column(
                children: [
                  Text("Pilih Tahun",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16.0)),
                  SizedBox(height: 20.0),
                  SizedBox(
                    height: 120,
                    child: CupertinoPicker(
                      itemExtent: 64,
                      selectionOverlay: Container(),
                      children: items
                          .map((item) => Center(
                              child: Text(item,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Montserrat"))))
                          .toList(),
                      onSelectedItemChanged: (index) {},
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (remotePDFpath.isNotEmpty) {
                        Get.off(() => ViewDocument(), arguments: remotePDFpath);
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
                            offset:
                                Offset(0.0, 4.0), // shadow direction: bottom
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Lihat Laporan",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  _monthPicker(context) {
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
              height: 260,
              child: Column(
                children: [
                  Text("Pilih Bulan",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16.0)),
                  SizedBox(height: 20.0),
                  SizedBox(
                    height: 120,
                    child: CupertinoPicker(
                      itemExtent: 64,
                      selectionOverlay: Container(),
                      children: anotherItems
                          .map((item) => Center(
                              child: Text(item,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Montserrat"))))
                          .toList(),
                      onSelectedItemChanged: (index) {},
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Get.off(() => ViewDocument()),
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
                            offset:
                                Offset(0.0, 4.0), // shadow direction: bottom
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Lihat Laporan",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
