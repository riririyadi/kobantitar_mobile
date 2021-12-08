import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/pengajuan_controller.dart';
import 'package:kobantitar_mobile/models/pengajuan.dart';
import 'package:kobantitar_mobile/screens/components/info_widget.dart';
import 'package:kobantitar_mobile/screens/pengajuan_screens/rincian_pengajuan.dart';

class PengajuanWidget extends StatefulWidget {
  const PengajuanWidget({Key? key}) : super(key: key);

  @override
  _PengajuanWidgetState createState() => _PengajuanWidgetState();
}

class _PengajuanWidgetState extends State<PengajuanWidget> {
  final PengajuanController controller = Get.put(PengajuanController());
  String _jenisPengajuan = "ALL";
  final currencyFormatter = NumberFormat('#,##0', 'ID');
  List<DataPengajuan> dataPengajuan = [];
  List<DataPengajuan> dataPengajuanFiltered = [];
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dataPengajuan = controller.pengajuanList;
    if (_jenisPengajuan == "LM") {
      dataPengajuan = dataPengajuan
          .where((tagihan) => tagihan.type!.endsWith("LM"))
          .toList();
    } else if (_jenisPengajuan == "KB") {
      dataPengajuan = dataPengajuan
          .where((tagihan) => tagihan.type!.endsWith("KB"))
          .toList();
    } else if (_jenisPengajuan == "KK") {
      dataPengajuan = dataPengajuan
          .where((tagihan) => tagihan.type!.endsWith("KK"))
          .toList();
    } else if (_jenisPengajuan == "KM") {
      dataPengajuan = dataPengajuan
          .where((tagihan) => tagihan.type!.endsWith("KM"))
          .toList();
    } else {
      dataPengajuan = dataPengajuan;
    }
    return Stack(children: [
      Positioned(
        left: 0,
        bottom: 0,
        top: 0,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffEE6A6A), Color(0xffC30707)]),
          ),
        ),
      ),
      Positioned(
        left: 0,
        top: 29,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pengajuan Anda',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 72,
        left: 0,
        bottom: 0,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xfff0f0f0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 5.0),
                child: Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 7.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 5.0), // shadow direction: bottom
                      )
                    ],
                  ),
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        dataPengajuanFiltered = dataPengajuan
                            .where((pengajuan) => pengajuan.caption!
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: 'Cari Pengajuan',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
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
                  padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _jenisPengajuan = "ALL";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        decoration: _jenisPengajuan == "ALL"
                            ? BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffC30707),
                                      Color(0xffEE6A6A)
                                    ]),
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                        0.0, 5.0), // shadow direction: bottom
                                  )
                                ],
                              )
                            : BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                        0.0, 5.0), // shadow direction: bottom
                                  )
                                ],
                              ),
                        child: Center(
                          child: Text('Semua Pengajuan',
                              style: TextStyle(
                                  color: _jenisPengajuan == "ALL"
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
                          _jenisPengajuan = "LM";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        decoration: _jenisPengajuan == "LM"
                            ? BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffC30707),
                                      Color(0xffEE6A6A)
                                    ]),
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                        0.0, 5.0), // shadow direction: bottom
                                  )
                                ],
                              )
                            : BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                        0.0, 5.0), // shadow direction: bottom
                                  )
                                ],
                              ),
                        child: Center(
                          child: Text('Pengajuan Logam Mulia',
                              style: TextStyle(
                                  color: _jenisPengajuan == "LM"
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
                          _jenisPengajuan = "KB";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        decoration: _jenisPengajuan == "KB"
                            ? BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffC30707),
                                      Color(0xffEE6A6A)
                                    ]),
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                        0.0, 5.0), // shadow direction: bottom
                                  )
                                ],
                              )
                            : BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                        0.0, 5.0), // shadow direction: bottom
                                  )
                                ],
                              ),
                        child: Center(
                          child: Text('Pengajuan Kredit Barang',
                              style: TextStyle(
                                  color: _jenisPengajuan == "KB"
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
                          _jenisPengajuan = "KK";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        decoration: _jenisPengajuan == "KK"
                            ? BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffC30707),
                                      Color(0xffEE6A6A)
                                    ]),
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                        0.0, 5.0), // shadow direction: bottom
                                  )
                                ],
                              )
                            : BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                        0.0, 5.0), // shadow direction: bottom
                                  )
                                ],
                              ),
                        child: Center(
                          child: Text('Pengajuan Kredit Kendaraan',
                              style: TextStyle(
                                  color: _jenisPengajuan == "KK"
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
                          _jenisPengajuan = "KM";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        decoration: _jenisPengajuan == "KM"
                            ? BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xffC30707),
                                      Color(0xffEE6A6A)
                                    ]),
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                        0.0, 5.0), // shadow direction: bottom
                                  )
                                ],
                              )
                            : BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                        0.0, 5.0), // shadow direction: bottom
                                  )
                                ],
                              ),
                        child: Center(
                          child: Text('Pengajuan Kredit Kobmart',
                              style: TextStyle(
                                  color: _jenisPengajuan == "KM"
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
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 2.0, 16.0, 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Daftar Pengajuan',
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              isEmpty()
                  ? buildIfEmpty()
                  : Flexible(
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: 5.0, bottom: 64.0),
                          itemCount: searchController.text.isEmpty
                              ? dataPengajuan.length
                              : dataPengajuanFiltered.length,
                          itemBuilder: (context, index) {
                            final pengajuan = searchController.text.isEmpty
                                ? dataPengajuan[index]
                                : dataPengajuanFiltered[index];
                            return buildPengajuanItem(pengajuan);
                          }),
                    ),
            ],
          ),
        ),
      ),
    ]);
  }

  bool isEmpty() {
    if (searchController.text.isEmpty) {
      return dataPengajuan.isEmpty;
    }
    return dataPengajuanFiltered.isEmpty;
  }

  Widget buildIfEmpty() {
    return const InfoWidget(
        icon: Icons.assistant_photo, text: 'Anda tidak memiliki pengajuan');
  }

  Padding buildPengajuanItem(DataPengajuan pengajuan) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: GestureDetector(
        onTap: () {
          if (pengajuan.type == "KM") return;
          Get.to(() => RincianPengajuan(),
              arguments: {"id": pengajuan.id, "type": pengajuan.type});
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 7.0,
                spreadRadius: 1.0,
                offset: Offset(0.0, 5.0), // shadow direction: bottom
              )
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color(0xfff0f0f0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: imageContainer(pengajuan.type!)),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(pengajuan.caption!,
                      style: TextStyle(fontWeight: FontWeight.w600))
                ],
              ),
              Column(
                children: [
                  Text(
                    'Total Angsuran',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Rp ${currencyFormatter.format(pengajuan.totalAngsuran)}',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Text('Angsuran Per Bulan', style: TextStyle(fontSize: 12.0)),
                  Spacer(),
                  Text(
                    'Rp ${currencyFormatter.format(pengajuan.angsuranPerBulan)}',
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Text('Tenor', style: TextStyle(fontSize: 12.0)),
                  Spacer(),
                  Text(
                    pengajuan.tenor!,
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Text('Status', style: TextStyle(fontSize: 12.0)),
                  Spacer(),
                  Text(
                    pengajuan.status!,
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.green),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Text('Keterangan', style: TextStyle(fontSize: 12.0)),
                  Spacer(),
                  Text(
                    "",
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              buildDetailButton(pengajuan)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailButton(DataPengajuan pengajuan) {
    if (pengajuan.type == "KM") {
      return Container();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10.0),
        Container(
          height: 1,
          decoration: BoxDecoration(color: Colors.grey[300]),
        ),
        const SizedBox(height: 10.0),
        Column(children: [
          Container(
            width: double.infinity,
            color: Colors.transparent,
            height: 25.0,
            child: const Center(
              child: Text(
                'Lihat Rincian',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 12.0),
              ),
            ),
          ),
        ]),
      ],
    );
  }

  Widget imageContainer(String tipePengajuan) {
    if (tipePengajuan == "LM") {
      return Container(
        width: 30,
        height: 30,
        child: Image(
            image: AssetImage('assets/gold-ingots.png'), fit: BoxFit.fill),
      );
    } else if (tipePengajuan == "KB") {
      return Container(
        width: 30,
        height: 30,
        child: Image(image: AssetImage('assets/device.png'), fit: BoxFit.fill),
      );
    } else if (tipePengajuan == "KK") {
      return Container(
        width: 30,
        height: 30,
        child: Image(image: AssetImage('assets/scooter.png'), fit: BoxFit.fill),
      );
    } else {
      return Container(
        width: 30,
        height: 30,
        child: Image(image: AssetImage('assets/store.png'), fit: BoxFit.fill),
      );
    }
  }
}
