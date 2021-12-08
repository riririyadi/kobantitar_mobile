import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/ubah_pin_controller.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/update_akun_sukses.dart';

class UbahPINBaru extends StatefulWidget {
  const UbahPINBaru({Key? key}) : super(key: key);

  @override
  _UbahPINBaruState createState() => _UbahPINBaruState();
}

class _UbahPINBaruState extends State<UbahPINBaru> {
  final controller = Get.put(UbahPINController());
  late TextEditingController pinBaruController;
  late TextEditingController konfirmPinBaruController;
  FocusNode focusNode = FocusNode();
  FocusNode focusNodeConfirm = FocusNode();

  @override
  void initState() {
    focusNode.requestFocus();
    pinBaruController = TextEditingController()
      ..addListener(() {
        if (pinBaruController.text.length < 7) {
          setState(() {});
          controller.pinBaru = pinBaruController.text;
        }
      });
    konfirmPinBaruController = TextEditingController()
      ..addListener(() {
        if (konfirmPinBaruController.text.length < 7) {
          setState(() {});
          controller.konfirmPinBaru = konfirmPinBaruController.text;
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    pinBaruController.dispose();
    super.dispose();
  }

  int _counter = 0;
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
                          'Ubah PIN',
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
                bottom: 0,
                left: 0,
                right: 0,
                top: 60,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        focusNode: focusNode,
                        maxLength: 6,
                        controller: pinBaruController,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                      ),
                        TextField(
                        focusNode: focusNodeConfirm,
                        maxLength: 6,
                        controller:  konfirmPinBaruController,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 60,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      _counter == 0
                          ? Container(
                              child: Column(
                              children: [
                                Text(
                                  "Masukkan PIN Baru Anda",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 30),
                                GestureDetector(
                                  onTap: () => focusNode.requestFocus(),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor:
                                            pinBaruController.text.length >= 1
                                                ? Colors.red
                                                : Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor:
                                            pinBaruController.text.length >= 2
                                                ? Colors.red
                                                : Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor:
                                            pinBaruController.text.length >= 3
                                                ? Colors.red
                                                : Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor:
                                            pinBaruController.text.length >= 4
                                                ? Colors.red
                                                : Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor:
                                            pinBaruController.text.length >= 5
                                                ? Colors.red
                                                : Colors.grey,
                                      ),
                                      SizedBox(width: 10),
                                      CircleAvatar(
                                        radius: 8,
                                        backgroundColor:
                                            pinBaruController.text.length >= 6
                                                ? Colors.red
                                                : Colors.grey,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ))
                          : Container(
                              child: Column(children: [
                              Text(
                                "Ulang PIN Baru Anda",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 30),
                              GestureDetector(
                                onTap: () => focusNode.requestFocus(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: konfirmPinBaruController
                                                  .text.length >=
                                              1
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    SizedBox(width: 10),
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: konfirmPinBaruController
                                                  .text.length >=
                                              2
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    SizedBox(width: 10),
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: konfirmPinBaruController
                                                  .text.length >=
                                              3
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    SizedBox(width: 10),
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: konfirmPinBaruController
                                                  .text.length >=
                                              4
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    SizedBox(width: 10),
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: konfirmPinBaruController
                                                  .text.length >=
                                              5
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    SizedBox(width: 10),
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: konfirmPinBaruController
                                                  .text.length >=
                                              6
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                  ],
                                ),
                              )
                            ])),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      print(_counter);
                      if (_counter == 1) {
                        controller.savePIN();
                      }
                      if (_counter == 0) {
                        setState(() {
                          _counter = 1;
                        });
                        focusNodeConfirm.requestFocus();

                      }
                    },
                    child: Container(
                      height: 48.0,
                      width: double.infinity,
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
                          'Selanjutnya',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
