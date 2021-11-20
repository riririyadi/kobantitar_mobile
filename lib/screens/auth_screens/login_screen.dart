import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/screens/auth_screens/buat_pin.dart';
import 'package:kobantitar_mobile/screens/auth_screens/daftar_akun_baru.dart';
import 'package:kobantitar_mobile/screens/components/gradient_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /** @change to true */
      resizeToAvoidBottomInset: true,
      /** @change wrap whole thing w/ this thing to avoid soft keyboard covering InputText  */
      body: SingleChildScrollView(
        child: ConstrainedBox(
           constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
          minHeight: MediaQuery.of(context).size.height,
        ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffEE6A6A), Color(0xffC30707)]),
            ),
            child: Stack(
              children: [
                /** @change move logo above */
                Positioned(
                  top: MediaQuery.of(context).size.height / 6,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: Center(
                      child: Image(
                        image: AssetImage("assets/kobantitar-logo.png"),
                        height: 94.0,
                        width: 225.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,  
                  left : 0,
                  right: 0,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24),
                          topLeft: Radius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            Text('Selamat Datang di Kobantitar Mobile'),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 40,
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10.0),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      prefixIcon: Icon(Icons.person),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      labelText: 'Masukkan email',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 40,
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10.0),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      prefixIcon: Icon(Icons.lock),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      labelText: 'Masukkan password',
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.visibility_off),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Lupa username / password?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffC30707)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () => Get.to(() => BuatPIN()),
                              child: Container(
                                height: 48.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xff851212),
                                        Color(0xffFF8A8A)
                                      ]),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 1.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(
                                          0.0, 4.0), // shadow direction: bottom
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Belum memiliki akun?'),
                            TextButton(
                              onPressed: () {
                                _bottomSheet(context);
                              },
                              child: Text(
                                'Daftar Sekarang',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffC30707),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _bottomSheet(context) {
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
                height: 280,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Daftar Akun',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                       /** @Change Gradient Button */
                      GradientButton(
                         onTap: () {
                          Get.back();
                          _bottomSheet2(context);
                        },
                        text: 'Anggota Lama',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      /** @Change Gradient Button */
                      GradientButton(
                        onTap: () => Get.off(() => DaftarAkunBaru()),
                        text: 'Daftar Anggota',
                        gradientColors: [Color(0xff56BC73), Color(0xff6CC585)],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      /** @Change Gradient Button */
                       GradientButton(
                        onTap: () => Get.off(() => DaftarAkunBaru()),
                        text: 'Non Anggota',
                        gradientColors: [Color(0xffDDDDDD), Color(0xffDDDDDD)],
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  _bottomSheet2(context) {
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
              child: Column(
                children: [
                  Text(
                    'Nomor Anggota',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: TextField(
                      style: TextStyle(fontSize: 12.0),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Masukkan Nomor Anggota"),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Get.off(() => DaftarAkunBaru()),
                    child: Container(
                      height: 48.0,
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
                          "Selanjutnya",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


