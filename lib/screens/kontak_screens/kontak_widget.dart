import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:kobantitar_mobile/controllers/kontak_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class KontakWidget extends StatefulWidget {
  const KontakWidget({Key? key}) : super(key: key);

  @override
  _KontakWidgetState createState() => _KontakWidgetState();
}

class _KontakWidgetState extends State<KontakWidget> {
  final KontakController controller = Get.put(KontakController());

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        left: 0,
        bottom: 0,
        top: 0,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffEE6A6A), Color(0xffC30707)]),
          ),
        ),
      ),
      Positioned(
        left: 0,
        top: 29,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Kontak Kami',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 72,
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xfff8f8f8),
          ),
          child: ListView(
            padding: EdgeInsets.only(bottom: 80.0),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
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
                      Text(
                        'Beritahu kami, kami akan dengan senang hati membantu anda',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller
                                  .openKontak(controller.kontak!.telepon!);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3.9,
                              height: 35.0,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 5.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffEE6A6A),
                                      Color(0xffC30707)
                                    ]),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 2,
                                    child: Icon(Icons.phone,
                                        color: Colors.white, size: 16.0),
                                  ),
                                  Center(
                                    child: Text(
                                      'Telepon',
                                      style: TextStyle(
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.openKontak(controller.kontak!.email!);
                            },
                            child: Container(
                              height: 35.0,
                              width: MediaQuery.of(context).size.width / 3.9,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 5.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffEE6A6A),
                                      Color(0xffC30707)
                                    ]),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 2,
                                    child: Icon(Icons.email_outlined,
                                        color: Colors.white, size: 16.0),
                                  ),
                                  Center(
                                    child: Text(
                                      'Email',
                                      style: TextStyle(
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller
                                  .openKontak(controller.kontak!.whatsapp!);
                            },
                            child: Container(
                              height: 35.0,
                              width: MediaQuery.of(context).size.width / 3.9,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 5.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffEE6A6A),
                                      Color(0xffC30707)
                                    ]),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 2,
                                    child: FaIcon(FontAwesomeIcons.whatsapp,
                                        color: Colors.white, size: 14.0),
                                  ),
                                  Center(
                                    child: Text(
                                      'WhatsApp',
                                      style: TextStyle(
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 22.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 7.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 5.0), // shadow direction: bottom
                      )
                    ],
                  ),
                  child: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Frequently Asked',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12.0),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        width: double.infinity,
                        height: 40,
                        child: TextField(
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              contentPadding: EdgeInsets.all(10.0),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              labelText: 'Cari Informasi',
                              fillColor: Color(0xffF0F0F0),
                              filled: true),
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.openLink(controller.faq!.logamMulia!);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 30.0,
                                width: 30.0,
                                child: Image(
                                    image: AssetImage('assets/gold-ingots.png'),
                                    fit: BoxFit.fill),
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Text(
                                'Transaksi Logam Mulia',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios, size: 16.0),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.openLink(controller.faq!.kreditBarang!);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 30.0,
                                width: 30.0,
                                child: Image(
                                    image: AssetImage('assets/wallet.png'),
                                    fit: BoxFit.fill),
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Text(
                                'Kredit Barang',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios, size: 16.0),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.openLink(controller.faq!.simulasiShu!);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 30.0,
                                width: 30.0,
                                child: Image(
                                    image: AssetImage(
                                        'assets/point-of-service.png'),
                                    fit: BoxFit.fill),
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Text(
                                'Simulasi SHU',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios, size: 16.0),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.openLink(controller.faq!.laporanKeuangan!);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 30.0,
                                width: 30.0,
                                child: Image(
                                    image:
                                        AssetImage('assets/presentation.png'),
                                    fit: BoxFit.fill),
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Text(
                                'Laporan Keuangan',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios, size: 16.0),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.openLink(controller.faq!.kobantitarMart!);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 30.0,
                                width: 30.0,
                                child: Image(
                                    image: AssetImage('assets/store.png'),
                                    fit: BoxFit.fill),
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Text(
                                'Kobantitar Mart',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios, size: 16.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
