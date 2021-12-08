import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:kobantitar_mobile/controllers/akun_controller.dart';
import 'package:kobantitar_mobile/screens/auth_screens/login_screen.dart';
import 'package:kobantitar_mobile/screens/akun_screens/pengaturan_akun.dart';
import 'package:kobantitar_mobile/screens/akun_screens/pengunduran_diri_anggota.dart';
import 'package:kobantitar_mobile/screens/akun_screens/ubah_password.dart';
import 'package:kobantitar_mobile/screens/akun_screens/ubah_pin_lama.dart';

class AkunWidget extends StatefulWidget {
  const AkunWidget({Key? key}) : super(key: key);

  @override
  _AkunWidgetState createState() => _AkunWidgetState();
}

class _AkunWidgetState extends State<AkunWidget> {
  final AkunController controller = Get.put(AkunController());

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
              color: Color(0xfff8f8f8),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
              ),
            ),
          ),
          bottom: 0,
          left: 0,
          right: 0,
          top: 120,
        ),
        ListView(
          padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 80.0),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                          Container(
                            height: 36,
                            width: 70,
                            child: Image(
                                image: AssetImage('assets/kobantitar-logo.png'),
                                fit: BoxFit.fill),
                          ),
                          Text(
                            'KARTU ANGGOTA',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                            ),
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
                                    image: AssetImage(
                                        'assets/kartu-anggota-qr.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () {
                              if (controller.isMeLoaded.value) {
                                return Text(
                                  "${controller.me.nama!.toUpperCase()}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              } else {
                                return Text("Loading");
                              }
                            },
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            if (controller.isMeLoaded.value) {
                              return Text(
                                '${controller.me.nomorAnggota}',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            } else {
                              return Text("Loading");
                            }
                          }),
                          GestureDetector(
                            onTap: () {
                              _bottomSheetBarCode(context);
                            },
                            child: Container(
                              height: 50,
                              width: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Container(
                                  height: 45,
                                  width: 65,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/kartu-anggota-bar.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: GestureDetector(
                onTap: () => Get.to(() => PengaturanAkun()),
                child: Container(
                  padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 5.0), // shadow direction: bottom
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Pengaturan Akun',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Icon(
                            Icons.create,
                            size: 20.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: GestureDetector(
                onTap: () => Get.to(() => UbahPassword()),
                child: Container(
                  padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 5.0), // shadow direction: bottom
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Ubah Password',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Icon(Icons.lock_outline, size: 20.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: GestureDetector(
                onTap: () => Get.to(() => UbahPINLama()),
                child: Container(
                  padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 5.0), // shadow direction: bottom
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Ubah PIN',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Icon(Icons.password, size: 20.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
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

                  controller.deleteLocalToken();
                  controller
                      .deleteDevice()
                      .then((value) => Get.offAll(() => LoginScreen()))
                      .catchError((e) => print(e));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 5.0), // shadow direction: bottom
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Logout',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Icon(Icons.login_outlined, size: 20.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: GestureDetector(
                onTap: () => Get.to(() => PengunduranDiriAnggota()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ajukan Pengunduran Diri Anggota",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xffE54444),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "V.${controller.setting.appVersionName}",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
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

  _bottomSheetBarCode(context) {
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
                  width: 170,
                  child: Image(
                    image: AssetImage('assets/kartu-anggota-bar.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
