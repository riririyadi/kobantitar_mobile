import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/screens/home_screen.dart';

class PesananSukses extends StatelessWidget {
  const PesananSukses({Key? key}) : super(key: key);

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
              top: MediaQuery.of(context).size.height / 10,
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
                    Icon(
                      Icons.verified_sharp,
                      size: 100.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text("Terima Kasih",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600)),
                    Text("Pesanan Anda",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        )),
                    Text("Sedang Kami Siapkan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        )),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text("Anda dapat mendatangi Toko Kobmart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        )),
                    Text("untuk mengambil pesanan anda",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        )),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: GestureDetector(
                onTap: () => Get.to(() => HomeScreen()),
                child: Container(
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        blurRadius: 1.0,
                        spreadRadius: 0.0,
                        offset: Offset(0.0, 4.0), // shadow direction: bottom
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Kembali Ke Home",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xff7C0A0A),
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
