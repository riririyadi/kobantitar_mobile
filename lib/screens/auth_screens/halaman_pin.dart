import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/halaman_pin_controller.dart';
import 'package:kobantitar_mobile/screens/auth_screens/biometric_auth.dart';
import 'package:kobantitar_mobile/screens/auth_screens/login_screen.dart';
import 'package:kobantitar_mobile/screens/home_screen.dart';
import 'dart:math';
import 'package:local_auth/local_auth.dart';

class HalamanPIN extends StatefulWidget {
  const HalamanPIN({Key? key}) : super(key: key);

  @override
  State<HalamanPIN> createState() => _HalamanPINState();
}

class _HalamanPINState extends State<HalamanPIN> {
  final HalamanPINController controller = Get.put(HalamanPINController());
  var rng = Random();
  List<int> pin = [];
  void insertPIN(int digit) {
    if (pin.length < 6) {
      setState(() {
        controller.listPin.add(digit);
        controller.pinController.text = (rng.nextInt(9999) * digit).toString();
        pin.add(digit);
      });
    }
  }

  bool? _hasBioSensor;

  LocalAuthentication authentication = LocalAuthentication();

  Future<void> _checkBio() async {
    try {
      _hasBioSensor = await authentication.canCheckBiometrics;

      print(_hasBioSensor);

      if (_hasBioSensor!) {
        _getAuth();
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _getAuth() async {
    bool isAuth = false;

    //loaded a dialog to scan fingerprint
    try {
      isAuth = await authentication.authenticate(
          localizedReason: 'Scan your finger print to authenticate',
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true);

      //if fingerprint scan match then
      //isAuth = true
      // therefore will navigate user to WelcomePage/HomePage of the App
      if (isAuth) {
        Get.to(() => HomeScreen());
      }

      print(isAuth);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    pin.clear();
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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  child: Center(
                    child: Image(
                      image: AssetImage("assets/kobantitar-logo.png"),
                      height: 44.0,
                      width: 100.0,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Selamat Datang Kembali",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      SizedBox(height: 20.0),
                      Text("Masukkan PIN",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: pin.length >= 1
                                ? Colors.white
                                : Colors.grey[400],
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: pin.length >= 2
                                ? Colors.white
                                : Colors.grey[400],
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: pin.length >= 3
                                ? Colors.white
                                : Colors.grey[400],
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: pin.length >= 4
                                ? Colors.white
                                : Colors.grey[400],
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: pin.length >= 5
                                ? Colors.white
                                : Colors.grey[400],
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: pin.length >= 6
                                ? Colors.white
                                : Colors.grey[400],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Text("Lupa pin?",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () => insertPIN(1),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    height:
                                        MediaQuery.of(context).size.width / 6,
                                    child: Center(
                                        child: Text("1",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600)))),
                              ),
                              GestureDetector(
                                onTap: () => insertPIN(2),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    height:
                                        MediaQuery.of(context).size.width / 6,
                                    child: Center(
                                        child: Text("2",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600)))),
                              ),
                              GestureDetector(
                                onTap: () => insertPIN(3),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    height:
                                        MediaQuery.of(context).size.width / 6,
                                    child: Center(
                                        child: Text("3",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600)))),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () => insertPIN(4),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    height:
                                        MediaQuery.of(context).size.width / 6,
                                    child: Center(
                                        child: Text("4",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600)))),
                              ),
                              GestureDetector(
                                onTap: () => insertPIN(5),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    height:
                                        MediaQuery.of(context).size.width / 6,
                                    child: Center(
                                        child: Text("5",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600)))),
                              ),
                              GestureDetector(
                                onTap: () => insertPIN(6),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    height:
                                        MediaQuery.of(context).size.width / 6,
                                    child: Center(
                                        child: Text("6",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600)))),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () => insertPIN(7),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    height:
                                        MediaQuery.of(context).size.width / 6,
                                    child: Center(
                                        child: Text("7",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600)))),
                              ),
                              GestureDetector(
                                onTap: () => insertPIN(8),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    height:
                                        MediaQuery.of(context).size.width / 6,
                                    child: Center(
                                        child: Text("8",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600)))),
                              ),
                              GestureDetector(
                                onTap: () => insertPIN(9),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    height:
                                        MediaQuery.of(context).size.width / 6,
                                    child: Center(
                                        child: Text("9",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600)))),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () => _checkBio(),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height: MediaQuery.of(context).size.width / 6,
                                  child: Center(
                                    child: Icon(Icons.fingerprint,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => insertPIN(0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height: MediaQuery.of(context).size.width / 6,
                                  child: Center(
                                    child: Text(
                                      "0",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (pin.isNotEmpty &&
                                      controller.listPin.isNotEmpty) {
                                    setState(() {
                                      pin.removeLast();
                                      controller.listPin.removeLast();
                                    });
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 6,
                                  height: MediaQuery.of(context).size.width / 6,
                                  child: Center(
                                    child: Icon(Icons.arrow_back_outlined,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(16),
                      height: 48.0,
                      child: Center(
                        child: Text(
                          "Ke Halaman Login",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
