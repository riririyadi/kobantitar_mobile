import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/screens/pengajuan_screens/rincian_pengajuan.dart';

class TagihanList extends StatefulWidget {
  const TagihanList({Key? key}) : super(key: key);

  @override
  _TagihanListState createState() => _TagihanListState();
}

class _TagihanListState extends State<TagihanList> {
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
                        'Sisa Tagihan',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Rp 3.289.500',
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
                        'Rp 590.000',
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
                        '26 Oktober 2021',
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
