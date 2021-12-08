import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/controllers/buat_pin_controller.dart';
import 'package:kobantitar_mobile/screens/auth_screens/verifikasi_pin.dart';
import 'package:kobantitar_mobile/screens/home_screen.dart';

class BuatPIN extends StatefulWidget {
  const BuatPIN({Key? key}) : super(key: key);

  @override
  _BuatPINState createState() => _BuatPINState();
}

class _BuatPINState extends State<BuatPIN> {
  final BuatPINController controller = Get.put(BuatPINController());
  late TextEditingController pinBaru;
  late TextEditingController konfirmPin;
  int counter = 0;
  final userData = GetStorage();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    pinBaru = TextEditingController()
      ..addListener(() {
        if (pinBaru.text.length < 7) {
          setState(() {});
          controller.pinBaru.text = pinBaru.text;
        }
      });
    konfirmPin = TextEditingController()
      ..addListener(() {
        if (konfirmPin.text.length < 7) {
          setState(() {});
          controller.konfirmPin.text = konfirmPin.text;
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    pinBaru.dispose();
    konfirmPin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                              "Buat PIN",
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
              bottom: 0,
              left: 0,
              right: 0,
              top: 72,
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
                      maxLength: 6,
                      focusNode: focusNode,
                      controller: counter == 0 ? pinBaru : konfirmPin,
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
              top: 72,
              child: Container(
                height: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24),
                  ),
                ),
                child: counter == 0
                    ? Column(
                        children: [
                          Text(
                            "Buat PIN untuk keamanan",
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
                                  backgroundColor: pinBaru.text.length >= 1
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: pinBaru.text.length >= 2
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: pinBaru.text.length >= 3
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: pinBaru.text.length >= 4
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: pinBaru.text.length >= 5
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: pinBaru.text.length >= 6
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 60),
                        child: Column(
                          children: [
                            Text(
                              "Verifikasi PIN untuk keamanan",
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
                                    backgroundColor: konfirmPin.text.length >= 1
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  SizedBox(width: 10),
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundColor: konfirmPin.text.length >= 2
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  SizedBox(width: 10),
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundColor: konfirmPin.text.length >= 3
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  SizedBox(width: 10),
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundColor: konfirmPin.text.length >= 4
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  SizedBox(width: 10),
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundColor: konfirmPin.text.length >= 5
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  SizedBox(width: 10),
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundColor: konfirmPin.text.length >= 6
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                    if (counter == 0) {
                      if (pinBaru.text.length >= 6) {
                        setState(() {
                          counter += 1;
                        });
                      } else {
                        Get.snackbar("Oops", "PIN tidak sesuai");
                      }
                    } else if (counter == 1) {
                      if (konfirmPin.text == pinBaru.text) {
                        userData.write("PIN", konfirmPin.text);
                        Get.offAll(() => HomeScreen());
                      } else {
                        Get.snackbar("Oops", "PIN tidak sesuai");
                      }
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
                          offset: Offset(0.0, 4.0), // shadow direction: bottom
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
    );
  }
}
