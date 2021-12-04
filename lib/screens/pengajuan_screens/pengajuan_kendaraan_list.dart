import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/pegajuan_controller.dart';
import 'package:kobantitar_mobile/screens/pengajuan_screens/rincian_pengajuan.dart';

class PengajuanKendaraanList extends StatefulWidget {
  const PengajuanKendaraanList({Key? key}) : super(key: key);

  @override
  _PengajuanKendaraanListState createState() => _PengajuanKendaraanListState();
}

class _PengajuanKendaraanListState extends State<PengajuanKendaraanList> {
  final controller = Get.put(PengajuanController());
  final currencyFormatter = NumberFormat('#,##0', 'ID');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 5.0, bottom: 64.0),
        itemCount: controller.pengajuanKreditKendaraan!.length,
        itemBuilder: (context, index) {
          final pengajuan = controller.pengajuanKreditKendaraan![index];
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
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text('Angsuran Per Bulan',
                          style: TextStyle(fontSize: 12.0)),
                      Spacer(),
                      Text(
                        'Rp ${currencyFormatter.format(pengajuan.angsuranPerBulan)}',
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w600),
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
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w600),
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
                        pengajuan.keterangan!,
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
                    onTap: () => Get.to(() => RincianPengajuan(), arguments: {
                      "id": pengajuan.id,
                      "type": pengajuan.type
                    }),
                    child: Column(children: [
                      Text(
                        'Lihat Rincian',
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          );
        });
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
