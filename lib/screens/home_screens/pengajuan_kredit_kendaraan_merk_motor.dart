import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/kredit_kendaraan_controller.dart';
import 'package:kobantitar_mobile/screens/home_screens/pengajuan_kredit_kendaraan_jenis_motor.dart';

class PengajuanKreditBarang extends StatefulWidget {
  const PengajuanKreditBarang({Key? key}) : super(key: key);

  @override
  _PengajuanKreditBarangState createState() => _PengajuanKreditBarangState();
}

class _PengajuanKreditBarangState extends State<PengajuanKreditBarang> {
  final KreditKendaraanController controller =
      Get.put(KreditKendaraanController());

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
                top: 20,
                left: 20,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
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
                          'Pengajuan Kredit Barang',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff8f8f8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                          child: Text(
                            "Pilih Merk Motor",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Obx(() {
                          if (controller.isLoading.value) {
                            return Center(child: Text("Loading..."));
                          } else {
                            return ListView.builder(
                              itemCount: controller.merkKendaraan!.length,
                              itemBuilder: (BuildContext context, int index) {
                                final kendaraan =
                                    controller.merkKendaraan![index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: GestureDetector(
                                    onTap: () => Get.to(
                                        () => PengajuanMotorJenis(),
                                        arguments: kendaraan.id),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 5.0,
                                            spreadRadius: 1.0,
                                            offset: Offset(0.0,
                                                5.0), // shadow direction: bottom
                                          )
                                        ],
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Color(0xfff0f0f0),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            // child: kendaraan.iconUrl
                                            //     ? Image.network(
                                            //         "${kendaraan.iconUrl}",
                                            //         fit: BoxFit.fill)
                                            //     : Container(
                                            //         decoration: BoxDecoration(
                                            //           color: Color(0xfff0f0f0),
                                            //           borderRadius:
                                            //               BorderRadius.circular(
                                            //                   10),
                                            //         ),
                                            //       ),
                                          ),
                                          SizedBox(
                                            width: 16.0,
                                          ),
                                          Text(
                                            "${kendaraan.brand}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        }),
                      ),
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
