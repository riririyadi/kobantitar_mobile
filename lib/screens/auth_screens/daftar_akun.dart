import "package:flutter/material.dart";
import 'package:get/get.dart';

class DaftarAkun extends StatefulWidget {
  const DaftarAkun({Key? key}) : super(key: key);

  @override
  _DaftarAkunState createState() => _DaftarAkunState();
}

class _DaftarAkunState extends State<DaftarAkun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffEE6A6A),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  height: 72,
                  decoration: BoxDecoration(
                    color: Color(0xffEE6A6A),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                                image: AssetImage('assets/kobantitar-logo.png'),
                                height: 72.0,
                                width: 100.0),
                            Text(
                              "Daftar Akun",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 72,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xffE54444),
                                  child: Icon(Icons.person,
                                      size: 12.0, color: Colors.white),
                                  radius: 14,
                                ),
                                SizedBox(width: 5.0),
                                Text("Data Pribadi",
                                    style: TextStyle(fontSize: 10.0)),
                                SizedBox(width: 5.0),
                                Container(
                                  height: 2,
                                  width: 30,
                                  decoration:
                                      BoxDecoration(color: Color(0xffE54444)),
                                ),
                                SizedBox(width: 5.0),
                                CircleAvatar(
                                  backgroundColor: Color(0xffE54444),
                                  child: Icon(Icons.home,
                                      size: 12.0, color: Colors.white),
                                  radius: 14,
                                ),
                                SizedBox(width: 5.0),
                                Text("Detail Bank",
                                    style: TextStyle(fontSize: 10.0)),
                                SizedBox(width: 5.0),
                                Container(
                                  height: 2,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xffE54444),
                                  ),
                                ),
                                SizedBox(width: 5.0),
                                CircleAvatar(
                                  backgroundColor: Color(0xffE54444),
                                  child: Icon(Icons.lock,
                                      size: 12.0, color: Colors.white),
                                  radius: 14,
                                ),
                                SizedBox(width: 5.0),
                                Text("Detail Akun",
                                    style: TextStyle(fontSize: 10.0)),
                                SizedBox(width: 5.0),
                                Container(
                                  height: 2,
                                  width: 30,
                                  decoration:
                                      BoxDecoration(color: Color(0xffE54444)),
                                ),
                                SizedBox(width: 5.0),
                                CircleAvatar(
                                  backgroundColor: Color(0xffE54444),
                                  child: Icon(Icons.document_scanner,
                                      size: 12.0, color: Colors.white),
                                  radius: 14,
                                ),
                                SizedBox(width: 5.0),
                                Text("Document",
                                    style: TextStyle(fontSize: 10.0)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                      child: Flexible(
                        child: ListView(
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
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
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
                                        border: Border.all(
                                            width: 1.0, color: Colors.grey)),
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
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
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
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
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
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
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
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText:
                                      'Masukkan 16 digit Jabatan / Bagian / Dept',
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
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: 'Masukkan Nomor Induk Pegawai',
                                ),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            GestureDetector(
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
                                    "Selanjutnya",
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
