import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kobantitar_mobile/controllers/signup_controller.dart';

class Dokumen extends StatefulWidget {
  const Dokumen({Key? key}) : super(key: key);

  @override
  _DokumenState createState() => _DokumenState();
}

class _DokumenState extends State<Dokumen> {
  final SignUpController controller = Get.put(SignUpController());
  bool simpanSelfie = false;
  bool simpanKTP = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      children: [
        Text(
          "Upload Foto Selfie",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5.0),
        Obx(
          () => controller.selectedSelfieImagePath.value == ""
              ? GestureDetector(
                  onTap: () {
                    _bottomSheet(context, 1);
                  },
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt_outlined, size: 50),
                          Text("Ambil Foto")
                        ],
                      ),
                    ),
                  ),
                )
              : Column(children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    child: Image.file(
                        File(controller.selectedSelfieImagePath.value),
                        fit: BoxFit.fitWidth),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () {
                              _bottomSheet(context, 1);
                            },
                            child: Text("Ambil ulang")),
                        GestureDetector(
                            onTap: () {
                              controller
                                  .uploadImage(
                                      controller.selectedSelfieImagePath.value,
                                      "selfie")
                                  .then((value) => Get.snackbar(
                                      "Success", "Image saved successfully"));
                            },
                            child: Text("Simpan"))
                      ])
                ]),
        ),
        SizedBox(height: 20.0),
        Text(
          "Upload Foto KTP",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5.0),
        Obx(
          () => controller.selectedKTPImagePath.value == ""
              ? GestureDetector(
                  onTap: () {
                    _bottomSheet(context, 2);
                  },
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt_outlined, size: 50),
                          Text("Ambil Foto")
                        ],
                      ),
                    ),
                  ),
                )
              : Column(children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    child: Image.file(
                        File(controller.selectedKTPImagePath.value),
                        fit: BoxFit.fitWidth),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            _bottomSheet(context, 2);
                          },
                          child: Text("Ambil ulang")),
                      GestureDetector(
                        onTap: () {
                          controller
                              .uploadImage(
                                  controller.selectedKTPImagePath.value, "ktp")
                              .then((value) => Get.snackbar(
                                  "Success", "Image saved successfully"));
                        },
                        child: Text("Simpan"),
                      ),
                    ],
                  ),
                ]),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  _bottomSheet(context, data) {
    int control = data;
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
                      'Ambil dari',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                if (control == 1) {
                                  controller.getSelfie(ImageSource.gallery);
                                } else {
                                  controller.getKTPImage(ImageSource.gallery);
                                }
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xfff0f0f0),
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    child: Icon(Icons.image),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("Gallery"),
                          ],
                        ),
                        SizedBox(
                          width: 50.0,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                if (control == 1) {
                                  controller.getSelfie(ImageSource.camera);
                                } else {
                                  controller.getKTPImage(ImageSource.camera);
                                }
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xfff0f0f0),
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    child: Icon(Icons.camera),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("Kamera"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
