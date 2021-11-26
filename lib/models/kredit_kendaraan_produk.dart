// To parse this JSON data, do
//
//     final kreditKendaraanProduk = kreditKendaraanProdukFromJson(jsonString);

import 'dart:convert';

List<KreditKendaraanProduk> kreditKendaraanProdukFromJson(String str) =>
    List<KreditKendaraanProduk>.from(
        json.decode(str).map((x) => KreditKendaraanProduk.fromJson(x)));

String kreditKendaraanProdukToJson(List<KreditKendaraanProduk> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KreditKendaraanProduk {
  KreditKendaraanProduk({
    this.id,
    this.productName,
    this.iconUrl,
    this.price,
  });

  int? id;
  String? productName;
  String? iconUrl;
  int? price;

  factory KreditKendaraanProduk.fromJson(Map<String, dynamic> json) =>
      KreditKendaraanProduk(
        id: json["id"],
        productName: json["product_name"],
        iconUrl: json["icon_url"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "icon_url": iconUrl,
        "price": price,
      };
}
