import 'package:flutter/material.dart';

class DetailBank extends StatefulWidget {
  const DetailBank({Key? key}) : super(key: key);

  @override
  _DetailBankState createState() => _DetailBankState();
}

class _DetailBankState extends State<DetailBank> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      children: [
        Text(
          "Pilih Bank",
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          height: 40,
          child: TextField(
            style: TextStyle(
              fontSize: 12.0,
            ),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: "Pilih Bank"),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "Nomor Rekening",
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          height: 40,
          child: TextField(
            style: TextStyle(
              fontSize: 12.0,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelText: 'Masukkan Nomor Rekening',
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "Cabang",
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          height: 40,
          child: TextField(
            style: TextStyle(
              fontSize: 12.0,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelText: 'Masukkan nama rekening',
            ),
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}
