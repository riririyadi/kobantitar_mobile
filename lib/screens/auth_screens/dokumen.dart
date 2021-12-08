import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kobantitar_mobile/controllers/signup_controller.dart';
import 'package:kobantitar_mobile/screens/components/image_picker.dart';

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
        Obx(() {
          return KobantitarImagePicker(
            selectedImagePath: controller.selectedImagePaths[SignUpImage.selfie],
            onChangeImage: () => controller.getImage(SignUpImage.selfie),
          );
        }),
        SizedBox(height: 20.0),
        Text(
          "Upload Foto KTP",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5.0),
        Obx(() {
          return KobantitarImagePicker(
            selectedImagePath: controller.selectedImagePaths[SignUpImage.ktp],
            onChangeImage: () => controller.getImage(SignUpImage.ktp),
          );
        }),
        SizedBox(height: 20.0),
      ],
    );
  }
}
