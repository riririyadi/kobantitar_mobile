import 'package:flutter/material.dart';

class Dokumen extends StatefulWidget {
  const Dokumen({Key? key}) : super(key: key);

  @override
  _DokumenState createState() => _DokumenState();
}

class _DokumenState extends State<Dokumen> {
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
        Container(
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
        SizedBox(height: 20.0),
        Text(
          "Upload Foto KTP",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5.0),
        Container(
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
        SizedBox(height: 20.0),
      ],
    );
  }
}
