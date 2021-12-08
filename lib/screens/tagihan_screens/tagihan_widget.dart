import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/tagihan_controller.dart';
import 'package:kobantitar_mobile/models/tagihan.dart';

class TagihanWidget extends StatefulWidget {
  const TagihanWidget({Key? key}) : super(key: key);

  @override
  _TagihanWidgetState createState() => _TagihanWidgetState();
}

class _TagihanWidgetState extends State<TagihanWidget> {
  final TagihanController controller = Get.put(TagihanController());

  String _jenisTagihan = "ALL";
  @override
  List<DataTagihan> dataTagihan = [];
  List<DataTagihan> dataTagihanFiltered = [];
  final currencyFormatter = NumberFormat('#,##0', 'ID');
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dataTagihan = controller.tagihanList;
    if (_jenisTagihan == "LM") {
      dataTagihan =
          dataTagihan.where((tagihan) => tagihan.type!.endsWith("LM")).toList();
    } else if (_jenisTagihan == "KB") {
      dataTagihan =
          dataTagihan.where((tagihan) => tagihan.type!.endsWith("KB")).toList();
    } else if (_jenisTagihan == "KK") {
      dataTagihan =
          dataTagihan.where((tagihan) => tagihan.type!.endsWith("KK")).toList();
    } else if (_jenisTagihan == "KM") {
      dataTagihan =
          dataTagihan.where((tagihan) => tagihan.type!.endsWith("KK")).toList();
    } else {
      dataTagihan = dataTagihan;
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
              'Tagihan Anda',
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
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        dataTagihanFiltered = dataTagihan
                            .where((tagihan) => tagihan.caption!
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
                        labelText: 'Cari Tagihan',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        prefixIcon: IconButton(
                            onPressed: () {}, icon: Icon(Icons.search)),
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
                          _jenisTagihan = "ALL";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        decoration: _jenisTagihan == "ALL"
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
                          child: Text('Semua Tagihan',
                              style: TextStyle(
                                  color: _jenisTagihan == "ALL"
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
                          _jenisTagihan = "LM";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        decoration: _jenisTagihan == "LM"
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
                          child: Text('Tagihan Logam Mulia',
                              style: TextStyle(
                                  color: _jenisTagihan == "LM"
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
                          _jenisTagihan = "KB";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        decoration: _jenisTagihan == "KB"
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
                          child: Text('Tagihan Kredit Barang',
                              style: TextStyle(
                                  color: _jenisTagihan == "KB"
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
                          _jenisTagihan = "KK";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        decoration: _jenisTagihan == "KK"
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
                          child: Text('Tagihan Kredit Kendaraan',
                              style: TextStyle(
                                  color: _jenisTagihan == "KK"
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
                          _jenisTagihan = "KM";
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        decoration: _jenisTagihan == "KM"
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
                          child: Text('Tagihan Kobmart',
                              style: TextStyle(
                                  color: _jenisTagihan == "KM"
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
                        'Daftar Tagihan',
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 5.0, bottom: 64.0),
                    itemCount: searchController.text.isEmpty
                        ? dataTagihan.length
                        : dataTagihanFiltered.length,
                    itemBuilder: (context, index) {
                      final tagihan = searchController.text.isEmpty
                          ? dataTagihan[index]
                          : dataTagihanFiltered[index];
                      return Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
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
                                offset: Offset(
                                    0.0, 5.0), // shadow direction: bottom
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
                                    child: Center(
                                        child: imageContainer(tagihan.type!)),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: Text("${tagihan.caption}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Sisa Tagihan',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    'Rp ${currencyFormatter.format(tagihan.sisaTagihan)}',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Text('Tagihan yang harus dibayar',
                                      style: TextStyle(fontSize: 12.0)),
                                  Spacer(),
                                  Text(
                                    'Rp ${currencyFormatter.format(tagihan.tagihanHarusDibayar)}',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.0),
                              Row(
                                children: [
                                  Text('Jatuh Tempo',
                                      style: TextStyle(fontSize: 12.0)),
                                  Spacer(),
                                  Text(
                                    '${tagihan.jatuhTempo}',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                height: 1,
                                decoration:
                                    BoxDecoration(color: Colors.grey[300]),
                              ),
                              SizedBox(height: 10.0),
                              GestureDetector(
                                onTap: () {},
                                child: Column(children: [
                                  Text(
                                    'Lihat Rincian',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12.0),
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget imageContainer(String tipeTagihan) {
    if (tipeTagihan == "LM") {
      return Container(
        width: 30,
        height: 30,
        child: Image(
            image: AssetImage('assets/gold-ingots.png'), fit: BoxFit.fill),
      );
    } else if (tipeTagihan == "KB") {
      return Container(
        width: 30,
        height: 30,
        child: Image(image: AssetImage('assets/device.png'), fit: BoxFit.fill),
      );
    } else if (tipeTagihan == "KK") {
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
