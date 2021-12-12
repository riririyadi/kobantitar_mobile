import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/tagihan_controller.dart';
import 'package:kobantitar_mobile/models/tagihan.dart';
import 'package:kobantitar_mobile/screens/components/info_widget.dart';
import 'package:kobantitar_mobile/screens/pengajuan_screens/rincian_pengajuan.dart';

class TagihanWidget extends StatefulWidget {
  const TagihanWidget({Key? key}) : super(key: key);

  @override
  _TagihanWidgetState createState() => _TagihanWidgetState();
}

class _TagihanWidgetState extends State<TagihanWidget> {
  final TagihanController controller = Get.put(TagihanController());
  String _jenisTagihan = "ALL";
  final currencyFormatter = NumberFormat('#,##0', 'ID');
  List<DataTagihan> dataTagihan = [];
  List<DataTagihan> dataTagihanFiltered = [];
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                colors: [Color(0xffEE6A6A), Color(0xffC30707), Color(0xfff8f8f8),Color(0xfff8f8f8)]),
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
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (value) {
                      controller.setFilter(q : value);
                      setState(() {});
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
                    buildFilterPills(
                      text: "Semua Tagihan",
                      type: "ALL"
                    ),
                    buildFilterPills(
                        text: "Tagihan Logam Mulia",
                        type: "LM"
                    ),
                    buildFilterPills(
                        text: "Tagihan Kredit Barang",
                        type: "KB"
                    ),
                    buildFilterPills(
                        text: "Tagihan Kredit Kendaraan",
                        type: "KK"
                    ),
                    buildFilterPills(
                        text: "Tagihan Kredit Kobmart",
                        type: "KM"
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
              buildListData(),
            ],
          ),
        ),
      ),
    ]);
  }

  GestureDetector buildFilterPills({required String type, required String text}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _jenisTagihan = type;
        });
        controller.setFilter(jenisTagihan: type == 'ALL' ? "" : type);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        decoration: _jenisTagihan == type
            ? BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xffC30707), Color(0xffEE6A6A)]),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 5.0), // shadow direction: bottom
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
                    offset: Offset(0.0, 5.0), // shadow direction: bottom
                  )
                ],
              ),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  color: _jenisTagihan == type ? Colors.white : Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }

  Widget buildListData() {
    return Obx(() {
      return Flexible(
        child: RefreshIndicator(
            onRefresh: controller.getTagihan,
            child: isEmpty()
                ? buildIfEmpty()
                : ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 5.0, bottom: 64.0),
                    itemCount: controller.filteredTagihanList.length,
                    itemBuilder: (context, index) {
                      final tagihan = controller.filteredTagihanList[index];
                      return buildTagihanItem(tagihan);
                    })),
      );
    });
  }

  bool isEmpty() {
    return controller.filteredTagihanList.isEmpty;
  }

  Widget buildIfEmpty() {
    return const SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: InfoWidget(
          icon: Icons.assistant_photo, text: 'Anda tidak memiliki pengajuan'),
    );
  }

  Padding buildTagihanItem(DataTagihan tagihan) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: GestureDetector(
        onTap: () {
          if (tagihan.type == "KM") return;
          Get.to(() => RincianPengajuan(),
              arguments: {"id": tagihan.id, "type": tagihan.type});
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
                    child: Center(child: imageContainer(tagihan.type!)),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text("${tagihan.caption}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w600)),
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
                    style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
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
                    style:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Text('Jatuh Tempo', style: TextStyle(fontSize: 12.0)),
                  Spacer(),
                  Text(
                    '${tagihan.jatuhTempo}',
                    style:
                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              buildDetailButton(tagihan)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailButton(DataTagihan tagihan) {
    if (tagihan.type == "KM") {
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
