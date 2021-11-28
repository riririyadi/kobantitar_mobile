// To parse this JSON data, do
//
//     final kendaraan = kendaraanFromJson(jsonString);

import 'dart:convert';

List<Kendaraan> kendaraanFromJson(String str) =>
    List<Kendaraan>.from(json.decode(str).map((x) => Kendaraan.fromJson(x)));

String kendaraanToJson(List<Kendaraan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kendaraan {
  Kendaraan({
    this.id,
    this.brand,
    this.iconUrl,
  });

  int? id;
  String? brand;
  dynamic? iconUrl;

  factory Kendaraan.fromJson(Map<String, dynamic> json) => Kendaraan(
        id: json["id"],
        brand: json["brand"],
        iconUrl: json["icon_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "icon_url": iconUrl,
      };
}
