// To parse this JSON data, do
//
//     final jenisKendaraan = jenisKendaraanFromJson(jsonString);

import 'dart:convert';

List<JenisKendaraan> jenisKendaraanFromJson(String str) =>
    List<JenisKendaraan>.from(
        json.decode(str).map((x) => JenisKendaraan.fromJson(x)));

String jenisKendaraanToJson(List<JenisKendaraan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JenisKendaraan {
  JenisKendaraan({
    this.id,
    this.productName,
    this.iconUrl,
    this.price,
  });

  int? id;
  String? productName;
  dynamic iconUrl;
  int? price;

  factory JenisKendaraan.fromJson(Map<String, dynamic> json) => JenisKendaraan(
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
