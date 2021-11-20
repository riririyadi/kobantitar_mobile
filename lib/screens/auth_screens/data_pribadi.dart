import 'package:flutter/material.dart';

class DataPribadi extends StatefulWidget {
  const DataPribadi({Key? key}) : super(key: key);

  @override
  _DataPribadiState createState() => _DataPribadiState();
}

class _DataPribadiState extends State<DataPribadi> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      children: [
        Text(
          "Nama Lengkap",
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
              labelText: 'Masukkan nama lengkap',
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "Jenis Kelamin",
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
        SizedBox(height: 5.0),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffE54444),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Pria",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1.0, color: Colors.grey)),
                child: Center(
                  child: Text(
                    "Wanita",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Text(
          "NIK / No. KTP",
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
              labelText: 'Masukkan 16 digit NIK / No. KTP',
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "Alamat Sesuai KTP",
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          height: 80,
          child: TextField(
            style: TextStyle(
              fontSize: 12.0,
            ),
            maxLines: 5,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelText: 'Masukkan Alamat Sesuai KTP',
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "Instansi",
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
          "Jabatan / Bagian / Dept.",
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
              labelText: 'Masukkan 16 digit Jabatan / Bagian / Dept',
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "NIP",
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
              labelText: 'Masukkan Nomor Induk Pegawai',
            ),
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}
