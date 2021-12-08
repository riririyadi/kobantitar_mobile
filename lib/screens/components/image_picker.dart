import 'dart:io';

import 'package:flutter/material.dart';

class KobantitarImagePicker extends StatelessWidget {
  final String? selectedImagePath;

  final void Function() onChangeImage;

  const KobantitarImagePicker({ 
    this.selectedImagePath,

    required this.onChangeImage,
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildImagePicker();
  }
  Container buildImagePicker() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: selectedImagePath == ""
            ? buildImagePickBox()
            : selectedImagePath == "LOADING"
                ? buildImageLoading()
                : buildImageSelectedBox(),
      ),
    );
  }

  Column buildImageSelectedBox() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Stack(children: [
        Container(
          height: 160,
          width: double.infinity,
          child: Image.file(
            File(selectedImagePath!),
            fit: BoxFit.fitWidth,
          ),
        )
      ]),
      SizedBox(height: 10),
      GestureDetector(
        onTap: onChangeImage,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text("Ambil ulang", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    ]);
  }

  GestureDetector buildImagePickBox() {
    return GestureDetector(
      onTap: onChangeImage,
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
    );
  }

  Widget buildImageLoading() {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}