import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kobantitar_mobile/models/product.dart';

import 'package:kobantitar_mobile/api_config/config.dart' as config;
import 'package:http/http.dart' as http;

class KobMartListProductController extends GetxController {
  var _products = {}.obs;
  String token = "";
  final userData = GetStorage();
  final searchQueryController = TextEditingController();

  @override
  void onInit() {
    token = userData.read("token");
    super.onInit();

    searchQueryController.addListener(() {
      
    });
  }

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
      Get.snackbar(
          "Yeah", "${product.name} berhasil di tambahkan ke keranjang");
    }
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get products => _products;

  get productSubtotal =>
      _products.entries.map((product) => product.key.price * product.value);

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element);

  List<dynamic> getDataPesananFromMap() {
    List<dynamic> data = [];

    _products.entries.forEach((entry) {
      Map<String, int> dataProduct = {
        "product_id": entry.key.id,
        "quantity": entry.value
      };
      data.add(dataProduct);
    });

    return data;
  }

  Future<String?> kirimPesanan() async {
    List<dynamic> dataPesanan = getDataPesananFromMap();
    print(dataPesanan);
    final response = await http.post(Uri.parse("${config.baseURL}/kobmart"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, dynamic>{"orders": dataPesanan}));
    if (response.statusCode == 200) {
      print("Kirim pesanan sukses");
      return "Pesanan berhasil di proses";
    } else {
      print(response.statusCode);

      return "";
    }
  }
}
