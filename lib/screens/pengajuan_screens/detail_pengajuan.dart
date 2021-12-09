import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/rincian_pengajuan_controller.dart';
import 'dart:math';

import 'package:kobantitar_mobile/screens/helper.dart';

class DetailPengajuan extends StatefulWidget {
  const DetailPengajuan({Key? key}) : super(key: key);

  @override
  _DetailPengajuanState createState() => _DetailPengajuanState();
}

class _DetailPengajuanState extends State<DetailPengajuan> {
  final controller = Get.put(RincianPengajuanController());
  final currencyFormatter = NumberFormat('#,##0', 'ID');

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Center(child: CircularProgressIndicator()),
        );
      } else {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                              child: imageContainer(
                                controller.pengajuan.type!,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('${controller.pengajuan.caption}',
                              style: TextStyle(fontWeight: FontWeight.w600))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Angsuran',
                            style: TextStyle(fontSize: 12.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Rp ${KobantitarHelper.toRupiah(controller.pengajuan.totalAngsuran)}',
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
                            'Rp ${controller.pengajuan.angsuranPerBulan}',
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Text('Tenor', style: TextStyle(fontSize: 12.0)),
                          Spacer(),
                          Text(
                            "${controller.pengajuan.tenor}",
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
                            '${controller.pengajuan.status}',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.green),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Column(
                        mainAxisSize : MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Keterangan', style: TextStyle(fontSize: 12.0)),
                          Text(
                            "${controller.pengajuan.keterangan ?? "-"}",
                            textAlign: TextAlign.center,
                            style: TextStyle(

                                fontSize: 12.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Riwayat Pengajuan",
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600)),
              ),
              Column(
                children: riwayatPengajuan(),
              )
            ],
          ),
        );
      }
    });
  }

  List<Widget> riwayatPengajuan() {
    List<Widget> list = [];
    //i<5, pass your dynamic limit as per your requirment
    for (int i = 0; i < controller.riwayatPengajuan.length; i++) {
      final riwayat = controller.riwayatPengajuan[i];
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
            child: Row(
              children: [
                Text(riwayat.caption!,
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Spacer(),
                Text(riwayat.date!,
                    style: TextStyle(
                      fontSize: 12.0,
                    )),
              ],
            ),
          ),
        ),
      ); //add any Widget in place of Text("Index $i")
    }
    return list; // all widget added now retrun the list here
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
