import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kobantitar_mobile/controllers/kobantitar_mart_list_produk_controller.dart';
import 'package:kobantitar_mobile/models/product.dart';

import 'package:kobantitar_mobile/screens/sukses_notifikasi_screens/pesanan_sukses.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({Key? key}) : super(key: key);

  @override
  _KeranjangState createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  final KobMartListProductController controller = Get.find();
  bool isProsesPesanan = false;

  final currencyFormatter = NumberFormat('#,##0', 'ID');

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
                          'Keranjang Anda',
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
                child: Obx(
                  () => Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).size.height / 1.3,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xfff8f8f8),
                    ),
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        itemCount: controller.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CartProductCard(
                            controller: controller,
                            product: controller.products.keys.toList()[index],
                            quantity:
                                controller.products.values.toList()[index],
                            index: index,
                          );
                        }),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.4,
                bottom: 0,
                left: 0,
                right: 0,
                child: Obx(() {
                  if (controller.products.length == 0) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("*) Harga dapat berbeda pada toko",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 12.0)),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Text("Estimasi Harga Total",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                              Spacer(),
                              Text("Rp. 0",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.snackbar("Oops...", "Keranjang anda kosong");
                            },
                            child: Container(
                              height: 48.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xff851212),
                                      Color(0xffFF8A8A)
                                    ]),
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
                                  'Pesan',
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
                    );
                  } else {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("*) Harga dapat berbeda pada toko",
                              style:
                                  TextStyle(color: Colors.red, fontSize: 12.0)),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Text("Estimasi Harga Total",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                              Spacer(),
                              Text(
                                  "Rp. ${currencyFormatter.format(controller.total)}",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              controller.getDataPesananFromMap();
                              _dialog(context);
                            },
                            child: Container(
                              height: 48.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xff851212),
                                      Color(0xffFF8A8A)
                                    ]),
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
                                  'Pesan',
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
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _dialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext c) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            content: isProsesPesanan
                ? CircularProgressIndicator()
                : const Text("Anda Yakin Ingin Kirim Pesanan?",
                    textAlign: TextAlign.center,
                    style: TextStyle(height: 1.6, fontWeight: FontWeight.w600)),
            actions: [
              Container(
                child: isProsesPesanan
                    ? Center(child: Text("Please wait"))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Batal",
                                      style: TextStyle(color: Colors.white),
                                    ))),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isProsesPesanan = true;
                                  });
                                  controller.kirimPesanan().then((value) {
                                    setState(() {
                                      isProsesPesanan = false;
                                    });
                                    Get.to(() => PesananSukses());
                                  }).catchError((e) {
                                    print(e);
                                  });
                                  // Get.to(() => PesananSukses());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xff851212),
                                          Color(0xffFF8A8A)
                                        ]),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Pesan",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
              ),
            ],
          );
        });
  }
}

final currencyFormatter = NumberFormat('#,##0', 'ID');

class CartProductCard extends StatelessWidget {
  final KobMartListProductController controller;
  final Product product;
  final int quantity;
  final int index;

  const CartProductCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
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
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name!),
            Text("Rp. ${currencyFormatter.format(product.price)}",
                style: TextStyle(
                    color: Color(0xffF53131), fontWeight: FontWeight.w600)),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.removeProduct(product);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        "-",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Text("${quantity}",
                    style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(width: 10.0),
                GestureDetector(
                  onTap: () => controller.addProduct(product),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        "+",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
