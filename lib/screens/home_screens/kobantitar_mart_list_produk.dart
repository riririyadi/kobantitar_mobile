import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:kobantitar_mobile/controllers/kobantitar_mart_list_produk_controller.dart';
import 'package:kobantitar_mobile/models/product.dart';
import 'package:kobantitar_mobile/screens/home_screens/kobantitar_mart_search_list_produk.dart';
import 'package:kobantitar_mobile/screens/home_screens/promo_kobmart.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'keranjang.dart';

class KobantitarMartListProduk extends StatefulWidget {
  const KobantitarMartListProduk({Key? key}) : super(key: key);

  @override
  _KobantitarMartListProdukState createState() =>
      _KobantitarMartListProdukState();
}

class _KobantitarMartListProdukState extends State<KobantitarMartListProduk> {
  final KobMartListProductController controller =
      Get.put(KobMartListProductController());
  final userData = GetStorage();
  late String token;

  int currentPage = 1;
  late int totalPages;
  int totalProducts = 0;
  int numOfproducts = 0;
  List<Product> products = [];
  List<Product> filteredProducts = [];
  final currencyFormatter = NumberFormat('#,##0', 'ID');

  final RefreshController refreshController2 =
      RefreshController(initialRefresh: true);

  Future<bool> getProducts({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    }

    final Uri uri = Uri.parse(
        "https://backend.kobantitar.com/api/kobmart/product?page=$currentPage");

    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final list = productFromJson(jsonEncode(json['data']['data']));
      if (isRefresh) {
        products = list;
      } else {
        products.addAll(list);
      }

      totalPages = (json['data']['pagination']['object_count'] / 15).ceil();
      numOfproducts = json['data']['pagination']['object_count'];

      currentPage++;
      setState(() {});

      return true;
    } else {
      return false;
    }
  }

  void refreshData() async {
    try {
      await getProducts(isRefresh: true);
      setState(() {});
      refreshController2.refreshCompleted();
    } catch (e) {
      refreshController2.refreshFailed();
    }
  }

  void loadData() async {
    try {
      await getProducts();

      if (products.length >= numOfproducts) {
        refreshController2.loadNoData();
      } else {
        setState(() {});
        refreshController2.loadComplete();
      }
    } catch (e) {
      refreshController2.loadFailed();
    }
  }

  @override
  void initState() {
    super.initState();
    token = userData.read('token');
  }

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
                      GestureDetector(
                        onTap: () => Get.to(() => Keranjang()),
                        child: Container(
                          child: Stack(
                            children: [
                              Icon(Icons.shopping_cart,
                                  size: 24, color: Colors.white),
                              Obx(
                                () => CircleAvatar(
                                  radius: 7,
                                  child: Text("${controller.products.length}",
                                      style: TextStyle(fontSize: 8.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
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
                          child: TextFormField(
                            controller: controller.searchQueryController,
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                labelText: 'Cari Produk',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: IconButton(
                                    onPressed: () => Get.to(
                                        () => KobantitarMartSearchListProduk()),
                                    icon: Icon(Icons.search)),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ),
                      ),
                      Flexible(
                        child: SmartRefresher(
                          controller: refreshController2,
                          enablePullUp: true,
                          onRefresh: refreshData,
                          onLoading: loadData,
                          footer: CustomFooter(
                            height: 30,
                            builder: (context, mode) {
                              if (mode == LoadStatus.idle) {
                                return Center(child: Text("Pull up to load"));
                              } else if (mode == LoadStatus.loading) {
                                return Center(
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              } else if (mode == LoadStatus.failed) {
                                return Center(child: Text("Load Failed!"));
                              } else if (mode == LoadStatus.canLoading) {
                                return Center(
                                    child: Text("release to load more"));
                              } else {
                                return Center(child: Text("No more Data"));
                              }
                            },
                          ),
                          child: ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Obx(() {
                                  if (controller.isKobmartLoaded.value) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16.0, 0, 16.0, 10),
                                      child: Column(
                                        children: [
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Promo Kobmart",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text("1-15 Sept 2021",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10.0),
                                                            textAlign:
                                                                TextAlign.left),
                                                      ],
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.to(
                                                            () =>
                                                                PromoKobmart(),
                                                            arguments: controller
                                                                .kobmart
                                                                .data!
                                                                .promoImageUrl);
                                                      },
                                                      child: Text(
                                                        'Lihat Semua',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: promoProducts(),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  } else {
                                    return SizedBox.shrink();
                                  }
                                });
                              }
                              index -= 1;
                              final product = products[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16.0, 8, 16.0, 8),
                                child: Container(
                                    padding: EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 5.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(0.0,
                                              5.0), // shadow direction: bottom
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("${product.name}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                        Text(
                                            "Rp ${currencyFormatter.format(product.price)}",
                                            style:
                                                TextStyle(color: Colors.red)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controller.addProduct(product);
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 5.0),
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Text("+ Keranjang",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white,
                                                          fontSize: 12))),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                              );
                            },
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

  List<Widget> promoProducts() {
    List<Widget> list = [];

    for (int i = 0; i < controller.kobmart.data!.promoProducts!.length; i++) {
      final product = controller.kobmart.data!.promoProducts![i];
      list.add(Container(
        width: MediaQuery.of(context).size.width / 4.2,
        height: 150.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                  "https://backend.kobantitar.com${product.imageUrl}"),
              Text(
                  "Rp ${currencyFormatter.format(product.hargaPromo).toString()}",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  )),
              Text(
                  "Rp ${currencyFormatter.format(product.hargaAwal).toString()}",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                  )),
            ],
          ),
        ),
      )); //add any Widget in place of Text("Index $i")
    }
    return list; // all widget added now retrun the list here
  }
}
