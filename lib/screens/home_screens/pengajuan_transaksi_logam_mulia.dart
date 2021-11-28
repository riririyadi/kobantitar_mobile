import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/pengajuan_logam_mulia_controller.dart';
import 'package:kobantitar_mobile/screens/home_screens/pengajuan_transaksi_logam_mulia_form.dart';
import 'package:kobantitar_mobile/screens/home_screens/simpanan_pokok.dart';
import 'package:kobantitar_mobile/screens/home_screens/simpanan_sukarela_screen.dart';
import 'package:kobantitar_mobile/screens/home_screens/simpanan_wajib.dart';

class PengajuanTransaksiLogamMulia extends StatefulWidget {
  const PengajuanTransaksiLogamMulia({Key? key}) : super(key: key);

  @override
  _PengajuanTransaksiLogamMuliaState createState() =>
      _PengajuanTransaksiLogamMuliaState();
}

class _PengajuanTransaksiLogamMuliaState
    extends State<PengajuanTransaksiLogamMulia> {
  final PengajuanLogamMuliaController controller =
      Get.put(PengajuanLogamMuliaController());

  String value = "";

  int amount = 0;
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
                          'Pengajuan Transaksi Logam Mulia',
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
                top: 70,
                left: 0,
                right: 0,
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Nilai Logam Mulia',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'RP 5.000.000',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 24.0),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '/ 4.28 gram',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 160,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff8f8f8),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24),
                    ),
                  ),
                  child: Container(
                    child: ListView(
                      padding: const EdgeInsets.only(
                        top: 16,
                        left: 16,
                        bottom: 10,
                        right: 16,
                      ),
                      children: [
                        Center(
                          child: Text(
                            "Pilih nominal harga logam mulia (Rp)",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  amount = 1;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3.8,
                                height: MediaQuery.of(context).size.width / 3.8,
                                decoration: BoxDecoration(
                                  color: amount == 1
                                      ? Color(0xffEE6A6A)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                          0.0, 5.0), // shadow direction: bottom
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            fontSize: 32.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Juta",
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  amount = 2;
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.width / 3.8,
                                width: MediaQuery.of(context).size.width / 3.8,
                                decoration: BoxDecoration(
                                  color: amount == 2
                                      ? Color(0xffEE6A6A)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                          0.0, 5.0), // shadow direction: bottom
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "2",
                                        style: TextStyle(
                                            fontSize: 32.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Juta",
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  amount = 3;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3.8,
                                height: MediaQuery.of(context).size.width / 3.8,
                                decoration: BoxDecoration(
                                  color: amount == 3
                                      ? Color(0xffEE6A6A)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                          0.0, 5.0), // shadow direction: bottom
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "3",
                                        style: TextStyle(
                                            fontSize: 32.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Juta",
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  amount = 5;
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.width / 3.8,
                                width: MediaQuery.of(context).size.width / 3.8,
                                decoration: BoxDecoration(
                                  color: amount == 5
                                      ? Color(0xffEE6A6A)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                          0.0, 5.0), // shadow direction: bottom
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "5",
                                        style: TextStyle(
                                            fontSize: 32.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Juta",
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  amount = 10;
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.width / 3.8,
                                width: MediaQuery.of(context).size.width / 3.8,
                                decoration: BoxDecoration(
                                  color: amount == 10
                                      ? Color(0xffEE6A6A)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                          0.0, 5.0), // shadow direction: bottom
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "10",
                                        style: TextStyle(
                                            fontSize: 32.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Juta",
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  amount = 99;
                                });
                                _bottomSheet(context);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3.8,
                                height: MediaQuery.of(context).size.width / 3.8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                          0.0, 5.0), // shadow direction: bottom
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Jumlah\nlainnya",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: GestureDetector(
                  onTap: () => Get.to(() => PengajuanTransaksiLogamMuliaForm()),
                  child: Container(
                    height: 48.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xff851212), Color(0xffFF8A8A)]),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 1.0,
                          spreadRadius: 0.0,
                          offset: Offset(0.0, 4.0), // shadow direction: bottom
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
            ],
          ),
        ),
      ),
    );
  }

  _bottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext c) {
          return SingleChildScrollView(
            child: Container(
              color: Color(0xff757575),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                height: 220,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Nilai Logam Mulia',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Nilai dalam rupiah"),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Obx(() {
                          if (controller.isLoading.value) {
                            return Center(child: Text("Loading"));
                          } else {
                            return DropdownButtonHideUnderline(
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent))),
                                value: value,
                                validator: (value) => value == null
                                    ? 'Instansi tidak boleh kosong'
                                    : null,
                                onChanged: (value) => setState(() {
                                  this.value = value.toString();
                                }),
                                items: controller.amountList!.map((item) {
                                  return DropdownMenuItem(
                                      value: item.id,
                                      child: Text(
                                          currencyFormatter.format(item.amount),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.0)));
                                }).toList(),
                              ),
                            );
                          }
                        }),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "*) Nilai maksimum Rp 20.000.000",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () =>
                            Get.off(() => PengajuanTransaksiLogamMuliaForm()),
                        child: Container(
                          height: 48.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xff851212), Color(0xffFF8A8A)]),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 1.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    0.0, 4.0), // shadow direction: bottom
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
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
