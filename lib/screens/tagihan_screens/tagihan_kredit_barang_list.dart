import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/tagihan_controller.dart';
import 'package:kobantitar_mobile/screens/pengajuan_screens/rincian_pengajuan.dart';

class TagihanKreditBarang extends StatefulWidget {
  const TagihanKreditBarang({Key? key}) : super(key: key);

  @override
  _TagihanKreditBarangState createState() => _TagihanKreditBarangState();
}

class _TagihanKreditBarangState extends State<TagihanKreditBarang> {
  final TagihanController controller = Get.put(TagihanController());
  final currencyFormatter = NumberFormat('#,##0', 'ID');

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Text("is loading...");
      } else {
        return ListView.builder(
            padding: EdgeInsets.only(top: 5.0, bottom: 64.0),
            itemCount: controller.tagihanKreditBarang.length,
            itemBuilder: (context, index) {
              final tagihan = controller.tagihanKreditBarang[index];
              return Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
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
                            child: Center(
                              child: Container(
                                width: 30,
                                height: 30,
                                child: Image(
                                    image: AssetImage('assets/device.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
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
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w600),
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
                                fontSize: 12.0, fontWeight: FontWeight.w600),
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
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 1,
                        decoration: BoxDecoration(color: Colors.grey[300]),
                      ),
                      SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () => Get.to(() => RincianPengajuan()),
                        child: Column(children: [
                          Text(
                            'Lihat Rincian',
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              );
            });
      }
    });
  }
}
