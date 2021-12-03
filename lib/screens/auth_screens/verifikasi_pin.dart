import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/buat_pin_controller.dart';
import 'package:kobantitar_mobile/screens/home_screen.dart';

class VerifikasiPIN extends StatefulWidget {
  const VerifikasiPIN({Key? key}) : super(key: key);

  @override
  _VerifikasiPINState createState() => _VerifikasiPINState();
}

class _VerifikasiPINState extends State<VerifikasiPIN> {
  final BuatPINController controller = Get.put(BuatPINController());
  late TextEditingController pinController;

  @override
  void initState() {
    pinController = TextEditingController()
      ..addListener(() {
        if (pinController.text.length < 7) {
          setState(() {});
          print(pinController.text);
          controller.konfirmPin = pinController.text;
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
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
                      controller: pinController,
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
                    Text(
                      "Verifikasi PIN untuk keamanan",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: pinController.text.length >= 1
                              ? Colors.red
                              : Colors.grey,
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: pinController.text.length >= 2
                              ? Colors.red
                              : Colors.grey,
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: pinController.text.length >= 3
                              ? Colors.red
                              : Colors.grey,
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: pinController.text.length >= 4
                              ? Colors.red
                              : Colors.grey,
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: pinController.text.length >= 5
                              ? Colors.red
                              : Colors.grey,
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: pinController.text.length >= 6
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ],
                    )
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
                  onTap: () => controller.savePIN(),
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
