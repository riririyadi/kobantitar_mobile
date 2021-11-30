import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/home_controller.dart';
import 'package:kobantitar_mobile/screens/home_screens/promo_kobmart.dart';

import 'keranjang.dart';

class KobantitarMartListProduk extends StatefulWidget {
  const KobantitarMartListProduk({Key? key}) : super(key: key);

  @override
  _KobantitarMartListProdukState createState() =>
      _KobantitarMartListProdukState();
}

class _KobantitarMartListProdukState extends State<KobantitarMartListProduk> {
  final HomeController controller = Get.put(HomeController());

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
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
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
                              'Kobantitar Mart',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => Get.to(() => Keranjang()),
                        icon: Icon(Icons.shopping_cart,
                            size: 20, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                  ),
                  child: ListView(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 16.0, 5.0),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 7.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(
                                          0.0, 5.0), // shadow direction: bottom
                                    )
                                  ],
                                ),
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10.0),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      labelText: 'Cari Produk',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      prefixIcon: Icon(Icons.search),
                                      fillColor: Colors.white,
                                      filled: true),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Text('Promo menarik'),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              padding: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffFF3C3C),
                                      Color(0xffEDD715)
                                    ]),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Promo Kobmart",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text("1-15 Sept 2021",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10.0),
                                              textAlign: TextAlign.left),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => PromoKobmart(),
                                              arguments: controller
                                                  .kobmart.promoImageUrl);
                                        },
                                        child: Text(
                                          'Lihat Semua',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4.2,
                                        height: 150.0,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.network(
                                                  "https://backend.kobantitar.com${controller.kobmart.promoProducts![0].imageUrl}"),
                                              Text(
                                                  "Rp ${currencyFormatter.format(controller.kobmart.promoProducts![0].hargaPromo).toString()}",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              Text(
                                                  "Rp ${currencyFormatter.format(controller.kobmart.promoProducts![0].hargaAwal).toString()}",
                                                  style: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 12,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4.2,
                                        height: 150.0,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.network(
                                                  "https://backend.kobantitar.com${controller.kobmart.promoProducts![1].imageUrl}"),
                                              Text(
                                                  "Rp ${currencyFormatter.format(controller.kobmart.promoProducts![1].hargaPromo).toString()}",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              Text(
                                                  "Rp ${currencyFormatter.format(controller.kobmart.promoProducts![1].hargaAwal).toString()}",
                                                  style: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 12,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4.2,
                                        height: 150,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.network(
                                                  "https://backend.kobantitar.com${controller.kobmart.promoProducts![2].imageUrl}"),
                                              Text(
                                                  "Rp ${currencyFormatter.format(controller.kobmart.promoProducts![2].hargaPromo).toString()}",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              Text(
                                                  "Rp ${currencyFormatter.format(controller.kobmart.promoProducts![2].hargaAwal).toString()}",
                                                  style: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 12,
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 7.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                    0.0, 5.0), // shadow direction: bottom
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Rebo Kuaci Biji Bunga Matahari Milk 150g"),
                              Text("Rp. 15.000",
                                  style: TextStyle(
                                      color: Color(0xffF53131),
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text("+ Keranjang",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600)),
                                  )
                                ],
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
