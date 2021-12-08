import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/akun_controller.dart';
import 'package:kobantitar_mobile/controllers/pengunduran_diri_controller.dart';
import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/pengajuan_sukses.dart';

class PengunduranDiriAnggota extends StatefulWidget {
  const PengunduranDiriAnggota({Key? key}) : super(key: key);

  @override
  _PengunduranDiriAnggotaState createState() => _PengunduranDiriAnggotaState();
}

class _PengunduranDiriAnggotaState extends State<PengunduranDiriAnggota> {
  final PengunduranDiriController controller =
      Get.put(PengunduranDiriController());

  bool isSubmitting = false;

  get onChanged => null;
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
                          'Pengunduran Diri Anggota',
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
                      Column(
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Anda yakin ingin mengundurkan diri dari Anggota Koperasi Kobantitar?",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    "Mohon Masukkan Alasan Pengunduran Diri",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Form(
                                    key: controller.mengundurkanDiriFormKey,
                                    child: Container(
                                      height: 100,
                                      child: TextFormField(
                                        controller: controller
                                            .alasanPengunduranDiriController,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          labelText:
                                              'Masukkan Alasan Pengunduran diri',
                                        ),
                                        validator: (value) {
                                          if (value == "") {
                                            return 'Alasan tidak boleh kosong';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: () => Get.off(() => {}),
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
                            child: Center(
                              child: Text(
                                "Saya Ingin Tetap Menjadi Anggota",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                        child: GestureDetector(
                          onTap: () {
                            if (controller.mengundurkanDiriFormKey.currentState!
                                .validate()) {
                              _bottomSheet(context);
                            }
                          },
                          child: Container(
                            height: 48.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xffDDDDDD),
                                    Color(0xfff8f8f8),
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
                                "Saya Ingin Mengundurkan Diri",
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  _bottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext c) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Form(
                key: controller.passwordFormKey,
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
                      child: Column(
                        children: [
                          Text(
                            'Password Anda',
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
                            child: TextFormField(
                              controller: controller.passwordController,
                              style: TextStyle(fontSize: 12.0),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: "Masukkan Password Anda"),
                              validator: (value) {
                                if (value == "") {
                                  return 'Password tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              if (controller.passwordFormKey.currentState!
                                  .validate()) {
                                setState(() {
                                  isSubmitting = true;
                                });
                                controller
                                    .ajukanPengunduranDiri(
                                        controller
                                            .alasanPengunduranDiriController
                                            .text,
                                        controller.passwordController.text)
                                    .then((value) {
                                  setState(() {
                                    isSubmitting = false;
                                  });
                                  Get.off(() => PengajuanSukses());
                                }).catchError((e) {
                                  setState(() {
                                    isSubmitting = false;
                                  });
                                  Get.snackbar("Error", "Something went wrong");
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
