import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/rincian_pengajuan_controller.dart';
import 'package:kobantitar_mobile/models/detail_pengajuan.dart';
import 'package:kobantitar_mobile/screens/components/info_widget.dart';
import 'package:kobantitar_mobile/screens/helper.dart';

class RiwayatTagihan extends StatefulWidget {
  const RiwayatTagihan({Key? key}) : super(key: key);

  @override
  _RiwayatTagihanState createState() => _RiwayatTagihanState();
}

class _RiwayatTagihanState extends State<RiwayatTagihan> {
  final controller = Get.put(RincianPengajuanController());
  final currencyFormatter = NumberFormat('#,##0', 'ID');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: controller.pengajuan.status == "Diproses"
          ? buildDiproses()
          : buildTagihanList(),
    );
  }

  Column buildTagihanList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Riwayat Tagihan",
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600)),
        ),
        Column(
          children: riwayatTagihan(),
        )
      ],
    );
  }

  Widget buildDiproses() {
    return const InfoWidget(
      icon: Icons.access_time_filled_rounded,
      text: 'Pengajuan anda sedang diproses',
    );
  }

  List<Widget> riwayatTagihan() {
    List<Widget> list = [];

    for (int i = 0; i < controller.riwayatTagihan.length; i++) {
      final riwayat = controller.riwayatTagihan[i];
      list.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: Offset(0.0, 5.0), // shadow direction: bottom
                )
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("${riwayat.caption}",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    Spacer(),
                    Text("${riwayat.date}",
                        style: TextStyle(
                          fontSize: 12.0,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Text(
                        "Rp ${KobantitarHelper.toRupiah(riwayat.amount?.toInt())}",
                        style: TextStyle(
                          color: Colors.green,
                        )),
                    Spacer(),
                    Text(riwayat.status == Status.PAID ? "PAID" : "UNPAID",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: riwayat.status == Status.PAID
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ); //add any Widget in place of Text("Index $i")
    }
    return list; // all widget added now retrun the list here
  }
}
