import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/controllers/laporan_keuangan_controller.dart';

class ViewDocument extends StatefulWidget {
  const ViewDocument({Key? key}) : super(key: key);

  @override
  _ViewDocumentState createState() => _ViewDocumentState();
}

class _ViewDocumentState extends State<ViewDocument> {
  final controller = Get.put(LaporanKeuanganController());
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffEE6A6A), Color(0xffC30707), Color(0xfff8f8f8),Color(0xfff8f8f8)]),
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
                  child: Stack(
                    children: [
                      Obx(() {
                        if (controller.isLoading.value) {
                          return SizedBox(
                            height: 0,
                            width: 0,
                          );
                        } else {
                          return PDFView(
                            filePath: controller.file.path,
                            enableSwipe: true,
                            swipeHorizontal: true,
                            autoSpacing: false,
                            pageFling: true,
                            pageSnap: true,
                            defaultPage: currentPage!,
                            fitPolicy: FitPolicy.BOTH,
                            preventLinkNavigation:
                                false, // if set to true the link is handled in flutter
                            onRender: (_pages) {
                              setState(() {
                                pages = _pages;
                                isReady = true;
                              });
                            },
                            onError: (error) {
                              setState(() {
                                errorMessage = error.toString();
                              });
                              print(error.toString());
                            },
                            onPageError: (page, error) {
                              setState(() {
                                errorMessage = '$page: ${error.toString()}';
                              });
                              print('$page: ${error.toString()}');
                            },
                            onViewCreated:
                                (PDFViewController pdfViewController) {
                              _controller.complete(pdfViewController);
                            },
                            onLinkHandler: (String? uri) {
                              print('goto uri: $uri');
                            },
                            onPageChanged: (int? page, int? total) {
                              print('page change: $page/$total');
                              setState(() {
                                currentPage = page;
                              });
                            },
                          );
                        }
                      }),
                      errorMessage.isEmpty
                          ? !isReady
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Container()
                          : Center(
                              child: Text(errorMessage),
                            )
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
