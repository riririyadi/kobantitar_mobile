import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/screens/home_screens/ambil_simpanan_sukarela.dart';

class SimulasiSHU extends StatefulWidget {
  const SimulasiSHU({Key? key}) : super(key: key);

  @override
  _SimulasiSHUState createState() => _SimulasiSHUState();
}

class _SimulasiSHUState extends State<SimulasiSHU> {
  int persentase = 5;
  int simpananPokok = 1000000;
  final simpananWajibController = TextEditingController();
  final simpananSukarelaController = TextEditingController();
  double hasil = 0;
  final currencyFormatter = NumberFormat('#,##0', 'ID');

  void hitungSHU() {
    setState(() {
      if (simpananWajibController.text == '') {
        simpananWajibController.text = '0';
      }
      if (simpananSukarelaController.text == '') {
        simpananSukarelaController.text = '0';
      }
      hasil = persentase /
          100 *
          (simpananPokok +
              int.parse(simpananWajibController.text.replaceAll('.', '')) +
              int.parse(simpananSukarelaController.text.replaceAll('.', '')));
    });
  }

  @override
  void initState() {
    simpananWajibController.text = '2.000.000';
    simpananSukarelaController.text = '3.000.000';
    hitungSHU();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffEE6A6A), Color(0xffC30707), Color(0xfff8f8f8),Color(0xfff8f8f8)]),
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
                          'Simulasi SHU',
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 8.0),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Simpanan Pokok",
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  "Rp 1.000.000",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  "Simpanan Wajib",
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  width: double.infinity,
                                  height: 40,
                                  child: TextField(
                                    onChanged: (e) => hitungSHU(),
                                    controller: simpananWajibController,
                                    inputFormatters: [
                                      ThousandsSeparatorInputFormatter()
                                    ],
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      prefixText: 'Rp  ',
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 10.0),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                Text(
                                  "Simpanan Sukarela",
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  width: double.infinity,
                                  height: 40,
                                  child: TextField(
                                    onChanged: (e) => hitungSHU(),
                                    controller: simpananSukarelaController,
                                    inputFormatters: [
                                      ThousandsSeparatorInputFormatter()
                                    ],
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                    decoration: InputDecoration(
                                      prefixText: 'Rp  ',
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 10.0),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                Text(
                                  "Perkiraan Keuntungan Per Tahun",
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 40,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (persentase > 0) {
                                                  persentase--;
                                                }
                                              });
                                              hitungSHU();
                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "-",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(persentase.toString()),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                persentase++;
                                              });
                                              hitungSHU();
                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Color(0xff9A3A3A),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "+",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      "%",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 24.0),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Perkiraan SHU yang akan didapat",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                "RP ${currencyFormatter.format(hasil.floor())}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
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
