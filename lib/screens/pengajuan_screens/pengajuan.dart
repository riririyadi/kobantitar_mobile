import 'package:flutter/material.dart';

class Pengajuan extends StatefulWidget {
  const Pengajuan({Key? key}) : super(key: key);

  @override
  _PengajuanState createState() => _PengajuanState();
}

class _PengajuanState extends State<Pengajuan> {
  bool value = false;

  int _jenisPengajuan = 0;
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
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
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
                        'Pengajuan',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                  ),
                  child: ListView(
                    children: [
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 16.0, 5.0),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 7.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                          0.0, 5.0), // shadow direction: bottom
                                    )
                                  ],
                                ),
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10.0),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      labelText: 'Cari Pengajuan',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      prefixIcon: Icon(Icons.search),
                                      fillColor: Colors.white,
                                      filled: true),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50.0,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 10.0, 16.0, 10.0),
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _jenisPengajuan = 0;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      decoration: _jenisPengajuan == 0
                                          ? BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color(0xffC30707),
                                                    Color(0xffEE6A6A)
                                                  ]),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 1.0,
                                                  offset: Offset(0.0,
                                                      5.0), // shadow direction: bottom
                                                )
                                              ],
                                            )
                                          : BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 1.0,
                                                  offset: Offset(0.0,
                                                      5.0), // shadow direction: bottom
                                                )
                                              ],
                                            ),
                                      child: Center(
                                        child: Text('Semua Pengajuan',
                                            style: TextStyle(
                                                color: _jenisPengajuan == 0
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _jenisPengajuan = 1;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      decoration: _jenisPengajuan == 1
                                          ? BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color(0xffC30707),
                                                    Color(0xffEE6A6A)
                                                  ]),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 1.0,
                                                  offset: Offset(0.0,
                                                      5.0), // shadow direction: bottom
                                                )
                                              ],
                                            )
                                          : BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 1.0,
                                                  offset: Offset(0.0,
                                                      5.0), // shadow direction: bottom
                                                )
                                              ],
                                            ),
                                      child: Center(
                                        child: Text('Pengajuan Logam Mulia',
                                            style: TextStyle(
                                                color: _jenisPengajuan == 1
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _jenisPengajuan = 2;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                      ),
                                      decoration: _jenisPengajuan == 2
                                          ? BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Color(0xffC30707),
                                                    Color(0xffEE6A6A)
                                                  ]),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 1.0,
                                                  offset: Offset(0.0,
                                                      5.0), // shadow direction: bottom
                                                )
                                              ],
                                            )
                                          : BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 5.0,
                                                  spreadRadius: 1.0,
                                                  offset: Offset(0.0,
                                                      5.0), // shadow direction: bottom
                                                )
                                              ],
                                            ),
                                      child: Center(
                                        child: Text('Pengajuan Kredit Barang',
                                            style: TextStyle(
                                                color: _jenisPengajuan == 2
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text('Daftar Pengajuan'),
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
