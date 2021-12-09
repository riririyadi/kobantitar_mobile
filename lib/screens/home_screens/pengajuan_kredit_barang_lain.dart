import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/pengajuan_kredit_barang_lain_controller.dart';
import 'package:kobantitar_mobile/screens/home_screens/ambil_simpanan_sukarela.dart';
import 'package:kobantitar_mobile/screens/home_screens/pengajuan_kredit_kendaraan_form.dart';
import 'package:kobantitar_mobile/screens/home_screens/pengajuan_kredit_barang_lain_form.dart';

class PengajuanKreditBarangLain extends StatefulWidget {
  const PengajuanKreditBarangLain({Key? key}) : super(key: key);

  @override
  _PengajuanKreditBarangLainState createState() =>
      _PengajuanKreditBarangLainState();
}

class _PengajuanKreditBarangLainState extends State<PengajuanKreditBarangLain> {
  final PengajuanKreditBarangLainController controller =
      Get.put(PengajuanKreditBarangLainController());
  final currencyFormatter = NumberFormat('#,##0', 'ID');

  bool _available = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
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
                            padding: EdgeInsets.all(16),
                            child: Form(
                              key: controller.dataBarangFormKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jenis Barang",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(
                                    width: double.infinity,
                                    height: 65,
                                    child: TextFormField(
                                      onChanged: (s) => checkIsAvailable(),
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                      controller:
                                          controller.jenisBarangController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 0.0),
                                        helperText: '',
                                        hintText: 'Cont.: Smartphone, Mesin Cuci, Televisi, dll',
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == "") {
                                          return 'Jenis barang tidak boleh kosong';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    "Tipe Barang",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(
                                    width: double.infinity,
                                    height: 65,
                                    child: TextFormField(
                                      onChanged: (s) => checkIsAvailable(),
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                      controller:
                                          controller.tipeBarangController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 0.0),
                                        helperText: '',
                                        hintText: 'Cont.: Xiaomi Note 3, Sharp 330, dll',
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == "") {
                                          return 'Tipe barang tidak boleh kosong';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    "Nilai Barang",
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(
                                    width: double.infinity,
                                    height: 65,
                                    child: TextFormField(
                                      onChanged: (s) => checkIsAvailable(),
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                      inputFormatters: [
                                        ThousandsSeparatorInputFormatter()
                                      ],
                                      controller:
                                          controller.nilaiBarangController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        prefixText: 'Rp ',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 0.0),
                                        helperText: ' ',
                                        hintText: 'Masukkan nilai estimasi harga',
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        value = value!.replaceAll(".", "");
                                        if (value == "") {
                                          return 'Nilai barang tidak boleh kosong';
                                        } else if (int.parse(value) <
                                            controller.nilaiMinimal) {
                                          return 'Nilai barang minimal Rp ${currencyFormatter.format(controller.nilaiMinimal)}';
                                        }
                                        return null;
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      if (!checkIsAvailable()) {
                        return;
                      }

                      if (controller.dataBarangFormKey.currentState!
                          .validate()) {
                        Get.to(() => PengajuanKreditBarangLainForm(),
                            arguments: [
                              {
                                "jenis_barang":
                                    controller.jenisBarangController.text,
                                "tipe_barang":
                                    controller.tipeBarangController.text,
                                "nilai_barang": controller
                                    .nilaiBarangController.text
                                    .replaceAll(".", "")
                              }
                            ]);
                      }
                    },
                    child: Container(
                      height: 48.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: !_available
                                ? [(Colors.grey[300])!, (Colors.grey[300])!]
                                : [Color(0xff851212), Color(0xffFF8A8A)]),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 1.0,
                            spreadRadius: 0.0,
                            offset:
                                Offset(0.0, 4.0), // shadow direction: bottom
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Selanjutnya",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool checkIsAvailable() {
    bool hasil = controller.checkData();
    setState(() {
      _available = hasil;
    });
    return hasil;
  }
}
