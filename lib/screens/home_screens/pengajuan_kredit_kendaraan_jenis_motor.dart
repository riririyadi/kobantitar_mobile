import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/pilih_jenis_motor_controller.dart';
import 'package:kobantitar_mobile/screens/home_screens/pengajuan_kredit_kendaraan_form.dart';

class PengajuanMotorJenis extends StatefulWidget {
  const PengajuanMotorJenis({Key? key}) : super(key: key);

  @override
  _PengajuanMotorJenisState createState() => _PengajuanMotorJenisState();
}

class _PengajuanMotorJenisState extends State<PengajuanMotorJenis> {
  final PilihJenisMotorController controller =
      Get.put(PilihJenisMotorController());
  final currencyFormatter = NumberFormat('#,##0', 'ID');
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                          child: Text(
                            "Pilih Jenis Motor",
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
                              itemCount: controller.listKendaraan!.length,
                              itemBuilder: (BuildContext context, int index) {
                                final kendaraan =
                                    controller.listKendaraan![index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: GestureDetector(
                                    onTap: () => Get.to(
                                        () => PengajuanKreditMotorForm(),
                                        arguments: kendaraan),
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
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Color(0xfff0f0f0),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                child: Image(
                                                    image: AssetImage(
                                                        "assets/scooter.png"),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${kendaraan.productName}",
                                                style:
                                                    TextStyle(fontSize: 12.0),
                                              ),
                                              Text(
                                                "RP ${currencyFormatter.format(kendaraan.price)}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16.0),
                                              ),
                                            ],
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
