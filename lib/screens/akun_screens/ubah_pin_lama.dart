import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/ubah_pin_controller.dart';
import 'package:kobantitar_mobile/screens/akun_screens/ubah_pin_baru.dart';

class UbahPINLama extends StatefulWidget {
  const UbahPINLama({Key? key}) : super(key: key);

  @override
  _UbahPINLamaState createState() => _UbahPINLamaState();
}

class _UbahPINLamaState extends State<UbahPINLama> {
  final controller = Get.put(UbahPINController());
  late TextEditingController pinController;

  @override
  void initState() {
    pinController = TextEditingController()
      ..addListener(() {
        if (pinController.text.length < 7) {
          setState(() {});
          print(pinController.text);
          controller.pin = pinController.text;
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
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
                top: 60,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Masukkan PIN Lama Anda",
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
                    onTap: () => Get.to(() => UbahPINBaru()),
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
