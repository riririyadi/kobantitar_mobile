import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/login_controller.dart';
import 'package:kobantitar_mobile/models/nomor_anggota.dart';
import 'package:kobantitar_mobile/screens/auth_screens/buat_pin.dart';
import 'package:kobantitar_mobile/screens/auth_screens/daftar_akun_baru.dart';
import 'package:kobantitar_mobile/screens/components/gradient_button.dart';
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _counter = 0;
  final loginFormKey = GlobalKey<FormState>();
  final nomorAnggotaFormKey = GlobalKey<FormState>();
  bool obscureValue = true;
  String _jenisPendaftaran = "";

  final LoginController controller = Get.put(LoginController());

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
                  top: MediaQuery.of(context).size.height / 7,
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
                  left: 0,
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
                              height: 30,
                            ),
                            Form(
                              key: loginFormKey,
                              child: Column(
                                children: [
                                  SizedBox(height: 65, child: emailField()),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(height: 65, child: passwordField()),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () => controller.openLink(),
                                        child: Text(
                                          'Lupa username / password?',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffC30707)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  loginButton(),
                                ],
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

  Widget emailField() {
    return TextFormField(
      style: TextStyle(
        fontSize: 14.0,
      ),
      controller: controller.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        helperText: ' ',
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: 'Masukkan email',
      ),
      validator: (value) {
        if (!value!.contains('@')) {
          return 'Invalid email address';
        }
        return null;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: obscureValue,
      style: TextStyle(
        fontSize: 14.0,
      ),
      controller: controller.passwordController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
        helperText: ' ',
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: 'Masukkan password',
        suffixIcon: IconButton(
          icon: Icon(obscureValue ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              obscureValue = !obscureValue;
            });
          },
        ),
      ),
      validator: (value) {
        if (value!.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }

  Widget loginButton() {
    return GestureDetector(
      onTap: () {
        if (loginFormKey.currentState!.validate()) {
          print(controller.emailController.text);
          print(controller.passwordController.text);

          // controller.printData(controller.emailController.text,
          //     controller.passwordController.text);
          controller.isLoading(true);
          controller
              .checkUser(controller.emailController.text,
                  controller.passwordController.text)
              .then((value) {
            controller.isLoading(false);
           
          }).catchError((e) {
            print(e);
            controller.isLoading(false);
          });
        }
      },
      // Get.to(() => BuatPIN());

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
        child: Center(child: Obx(() {
          if (controller.isLoading.value) {
            return CircularProgressIndicator(
              color: Colors.white,
            );
          } else {
            return Text(
              'Login',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            );
          }
        })),
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
                        onTap: () => Get.off(() => DaftarAkunBaru(),
                            arguments: [null, "BARU"]),
                        text: 'Daftar Menjadi Anggota Baru',
                        gradientColors: [Color(0xff56BC73), Color(0xff6CC585)],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      /** @Change Gradient Button */
                      GradientButton(
                        onTap: () => Get.off(() => DaftarAkunBaru(),
                            arguments: [null, "NON"]),
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
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
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
              height: 200,
              child: Center(
                child: Form(
                  key: nomorAnggotaFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                        height: 65,
                        child: TextFormField(
                          controller: controller.nomorAnggotaController,
                         keyboardType: TextInputType.numberWithOptions(
                           signed: false, decimal: false
                         ),
                          style: TextStyle(fontSize: 12.0),
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              helperText: ' ',
                              
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 0.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: "Masukkan Nomor Anggota"),
                          validator: (value) {
                            if (value!.length < 4) {
                              return 'Nomor must be at least 4 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (nomorAnggotaFormKey.currentState!.validate()) {
                            print(controller.nomorAnggotaController.text);
                            controller.isLoading2(true);
                            controller
                                .checkNomorAnggota(int.parse(
                                    controller.nomorAnggotaController.text))
                                .then((value) => controller.isLoading2(false))
                                .catchError((e) {
                              print(e);
                            });
                          }
                        },
                        child: Container(
                          height: 48.0,
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
                          child: Center(child: Obx(() {
                            if (controller.isLoading2.value) {
                              return CircularProgressIndicator(
                                color: Colors.white,
                              );
                            } else {
                              return Text(
                                'Selanjutnya',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              );
                            }
                          })),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
