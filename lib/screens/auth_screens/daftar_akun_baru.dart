import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:kobantitar_mobile/api_config/config.dart';
import 'package:kobantitar_mobile/controllers/signup_controller.dart';
import 'package:kobantitar_mobile/screens/auth_screens/data_pribadi.dart';
import 'package:kobantitar_mobile/screens/components/gradient_button.dart';
import 'package:kobantitar_mobile/screens/components/webview.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/pendaftaran_sukses.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  final SignUpController controller = Get.put(SignUpController());
  final scrollController = ScrollController();

  void scrollToEnd() {
    final double end = scrollController.position.maxScrollExtent;
    scrollController.jumpTo(end);
  }

  bool isSubmitting = false;

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
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: controller.step >= 0
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
                                decoration: controller.step >= 1
                                    ? BoxDecoration(color: Color(0xffE54444))
                                    : BoxDecoration(color: Color(0xffe0e0e0)),
                              ),
                              SizedBox(width: 5.0),
                              CircleAvatar(
                                backgroundColor: controller.step >= 1
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
                                decoration: controller.step >= 2
                                    ? BoxDecoration(color: Color(0xffE54444))
                                    : BoxDecoration(color: Color(0xffe0e0e0)),
                              ),
                              SizedBox(width: 5.0),
                              CircleAvatar(
                                backgroundColor: controller.step >= 2
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
                                decoration: controller.step >= 3
                                    ? BoxDecoration(color: Color(0xffE54444))
                                    : BoxDecoration(color: Color(0xffe0e0e0)),
                              ),
                              SizedBox(width: 5.0),
                              CircleAvatar(
                                backgroundColor: controller.step >= 3
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
                        index: controller.step,
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
                      child: GradientButton(
                          onTap: () {
                            if (controller.step == 0) {
                              if (controller.dataPribadiFormKey.currentState!
                                  .validate()) {
                                setState(() {
                                  controller.step += 1;
                                });
                              }
                            } else if (controller.step == 1) {
                              if (controller.detailBankFormKey.currentState!
                                  .validate()) {
                                setState(() {
                                  controller.step += 1;
                                });
                              }
                            } else if (controller.step == 2) {
                              if (controller.detailAkunFormKey.currentState!
                                  .validate()) {
                                scrollToEnd();
                                setState(() {
                                  controller.step += 1;
                                });
                              }
                            } else if (controller.step == 3) {
                              if (controller.checkIsImageFilled()) {
                                _dialog(context);
                              } else {
                                Get.snackbar("Mohon Upload Foto",
                                    "Mohon Upload Foto KTP dan Selfie anda");
                                return;
                              }
                            }
                          },
                          text: "Selanjutnya"),
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

  _dialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext c) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            actions: [
              Container(
                padding: EdgeInsets.all(10),
                child: isSubmitting
                    ? Center(child: Text("Please wait"))
                    : Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  "Anda Setuju Untuk Menjadi Anggota Kobantitar?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  )),
                              SizedBox(height: 20),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text.rich(
                                        TextSpan(
                                          text: 'Dengan ini saya menyetujui ',
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                          children: <InlineSpan>[
                                            TextSpan(
                                                text: 'Syarat & Ketentuan',
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Get.to(() => KobantitarWebview(
                                                            judul:
                                                                "Terms & Condition Pendaftaran",
                                                            url: baseURI +
                                                                "/informasi/1"));
                                                      },
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Color(0xffEE6A6A))),
                                            const TextSpan(
                                                text:
                                                    ' menjadi Anggota Koperasi Banten Tiga Lontar',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                )),
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ]),
                              SizedBox(height: 20),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child:
                                                Center(child: Text("Batal"))),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.defaultDialog(
                                            title: "",
                                            content: Column(
                                              children: [
                                                CircularProgressIndicator(),
                                                SizedBox(height: 10),
                                                Text("Please wait")
                                              ],
                                            ),
                                            barrierDismissible: false,
                                          );
                                          controller.signUp();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xff851212),
                                                  Color(0xffFF8A8A)
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Setuju",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ]),
                      ),
              ),
            ],
          );
        });
  }
}
