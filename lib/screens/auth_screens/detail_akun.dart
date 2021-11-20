import 'package:flutter/material.dart';

class DetailAkun extends StatefulWidget {
  const DetailAkun({Key? key}) : super(key: key);

  @override
  _DetailAkunState createState() => _DetailAkunState();
}

class _DetailAkunState extends State<DetailAkun> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      children: [
        Text(
          "Alamat Email",
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
                labelText: "Masukkan Alamat Email"),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "No. HP (Whatsapp)",
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
              labelText: 'Masukkan Nomor HP yang terkait dengan WA',
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "Password",
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
              labelText: 'Masukkan password',
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "Konfirmasi Password",
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
              labelText: 'Masukkan konfirmasi password',
            ),
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}
