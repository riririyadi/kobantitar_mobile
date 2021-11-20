import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/screens/pengajuan_screens/rincian_pengajuan.dart';

class SemuaPengajuan extends StatefulWidget {
  const SemuaPengajuan({Key? key}) : super(key: key);

  @override
  _SemuaPengajuanState createState() => _SemuaPengajuanState();
}

class _SemuaPengajuanState extends State<SemuaPengajuan> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 5.0, bottom: 64.0),
        itemCount: 3,
        itemBuilder: (context, index) {
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
                                image: AssetImage('assets/gold-ingots.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('Emas 5 Gram',
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
                        'Rp 3.570.500',
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
                      Text('Harga Barang', style: TextStyle(fontSize: 12.0)),
                      Spacer(),
                      Text(
                        'Rp 2.820.400',
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text('Angsuran Per Bulan',
                          style: TextStyle(fontSize: 12.0)),
                      Spacer(),
                      Text(
                        'Rp 297.541',
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Text('Metode Pembayaran',
                          style: TextStyle(fontSize: 12.0)),
                      Spacer(),
                      Text(
                        'Kredit',
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
                        '12 bulan',
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
                        'Diterima',
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
                        'Memenuhi Syarat',
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
}
