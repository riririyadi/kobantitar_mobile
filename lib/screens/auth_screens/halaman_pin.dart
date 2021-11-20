import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/screens/auth_screens/login_screen.dart';

class HalamanPIN extends StatefulWidget {
  const HalamanPIN({Key? key}) : super(key: key);

  @override
  State<HalamanPIN> createState() => _HalamanPINState();
}

class _HalamanPINState extends State<HalamanPIN> {
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
          child: Stack(children: [
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Image(
                  image: AssetImage("assets/kobantitar-logo.png"),
                  height: 44.0,
                  width: 100.0,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
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
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
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
                            Container(
                                width: MediaQuery.of(context).size.width / 6,
                                height: MediaQuery.of(context).size.width / 6,
                                child: Center(
                                    child: Text("1",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)))),
                            Container(
                                width: MediaQuery.of(context).size.width / 6,
                                height: MediaQuery.of(context).size.width / 6,
                                child: Center(
                                    child: Text("2",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)))),
                            Container(
                                width: MediaQuery.of(context).size.width / 6,
                                height: MediaQuery.of(context).size.width / 6,
                                child: Center(
                                    child: Text("3",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)))),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width / 6,
                                height: MediaQuery.of(context).size.width / 6,
                                child: Center(
                                    child: Text("4",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)))),
                            Container(
                                width: MediaQuery.of(context).size.width / 6,
                                height: MediaQuery.of(context).size.width / 6,
                                child: Center(
                                    child: Text("5",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)))),
                            Container(
                                width: MediaQuery.of(context).size.width / 6,
                                height: MediaQuery.of(context).size.width / 6,
                                child: Center(
                                    child: Text("6",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)))),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width / 6,
                                height: MediaQuery.of(context).size.width / 6,
                                child: Center(
                                    child: Text("7",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)))),
                            Container(
                                width: MediaQuery.of(context).size.width / 6,
                                height: MediaQuery.of(context).size.width / 6,
                                child: Center(
                                    child: Text("8",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)))),
                            Container(
                                width: MediaQuery.of(context).size.width / 6,
                                height: MediaQuery.of(context).size.width / 6,
                                child: Center(
                                    child: Text("9",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600)))),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.width / 6,
                              child: Center(
                                child: Icon(Icons.fingerprint,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
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
                            Container(
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.width / 6,
                              child: Center(
                                child: Icon(Icons.arrow_back_outlined,
                                    color: Colors.white),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: GestureDetector(
                onTap: () => Get.to(() => LoginScreen()),
                child: Container(
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
