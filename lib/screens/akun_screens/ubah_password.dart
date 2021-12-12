import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/akun_controller.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/pengajuan_sukses.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/update_akun_sukses.dart';

class UbahPassword extends StatefulWidget {
  const UbahPassword({Key? key}) : super(key: key);

  @override
  _UbahPasswordState createState() => _UbahPasswordState();
}

class _UbahPasswordState extends State<UbahPassword> {
  final AkunController controller = Get.put(AkunController());

  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffEE6A6A), Color(0xffC30707), Color(0xfff8f8f8),Color(0xfff8f8f8)]),
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
                          'Ubah Password',
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
                top: 60,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff8f8f8),
                  ),
                  child: ListView(
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Form(
                                  key: controller.ubahPasswordFormKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ubah Password",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        "Password Lama",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Container(
                                        height: 65,
                                        child: TextFormField(
                                          obscureText: true,
                                          controller:
                                              controller.passwordLamaController,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                          decoration: InputDecoration(
                                            helperText: ' ',
                                            contentPadding:
                                                EdgeInsets.all(10.0),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            labelText: 'Masukkan password lama',
                                          ),
                                          validator: (value) {
                                            if (value == "") {
                                              return 'Password lama tidak boleh kosong';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        "Password Baru",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Container(
                                        height: 65,
                                        child: TextFormField(
                                          obscureText: true,
                                          controller:
                                              controller.passwordBaruController,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                          decoration: InputDecoration(
                                            helperText: ' ',
                                            contentPadding:
                                                EdgeInsets.all(10.0),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            labelText: 'Masukkan password baru',
                                          ),
                                          validator: (value) {
                                            if (value!.length < 6) {
                                              return 'Password baru minimal 6 karakter';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        "Ulang Password Baru",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Container(
                                        height: 65,
                                        child: TextFormField(
                                          obscureText: true,
                                          controller: controller
                                              .konfirmPasswordController,
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                          decoration: InputDecoration(
                                            helperText: ' ',
                                            contentPadding:
                                                EdgeInsets.all(10.0),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            labelText: 'Ulang Password Baru',
                                          ),
                                          validator: (value) {
                                            if (value !=
                                                controller
                                                    .passwordBaruController
                                                    .text) {
                                              return 'Konfimasi password harus sesuai dengan password baru';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: GestureDetector(
                                onTap: () => {
                                  if (controller
                                      .ubahPasswordFormKey.currentState!
                                      .validate())
                                    {
                                      setState(() {
                                        isSubmitting = true;
                                      }),
                                      controller
                                          .ubahPassword(
                                              controller
                                                  .passwordLamaController.text,
                                              controller
                                                  .konfirmPasswordController
                                                  .text)
                                          .then((value) {
                                        setState(() {
                                          isSubmitting = true;
                                        });
                                        Get.to(() => PengajuanSukses());
                                      }).catchError((e) {
                                        setState(() {
                                          isSubmitting = true;
                                        });
                                        print(e);
                                      })
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
                                        offset: Offset(0.0,
                                            4.0), // shadow direction: bottom
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: isSubmitting
                                        ? CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text(
                                            "Submit",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
