// To parse this JSON data, do
//
//     final kreditKendaraanCalculation = kreditKendaraanCalculationFromJson(jsonString);

import 'dart:convert';

KreditKendaraanCalculation kreditKendaraanCalculationFromJson(String str) =>
    KreditKendaraanCalculation.fromJson(json.decode(str));

String kreditKendaraanCalculationToJson(KreditKendaraanCalculation data) =>
    json.encode(data.toJson());

class KreditKendaraanCalculation {
  KreditKendaraanCalculation({
    this.success,
    this.status,
    this.data,
  });

  bool? success;
  String? status;
  DetailData? data;

  factory KreditKendaraanCalculation.fromJson(Map<String, dynamic> json) =>
      KreditKendaraanCalculation(
        success: json["success"],
        status: json["status"],
        data: DetailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "data": data!.toJson(),
      };
}

class DetailData {
  DetailData({
    this.product,
    this.tenor,
    this.angsuranPokok,
    this.marginPerBulan,
    this.angsuranPerBulan,
    this.totalAngsuran,
  });

  Product? product;
  Tenor? tenor;
  int? angsuranPokok;
  int? marginPerBulan;
  int? angsuranPerBulan;
  int? totalAngsuran;

  factory DetailData.fromJson(Map<String, dynamic> json) => DetailData(
        product: Product.fromJson(json["product"]),
        tenor: Tenor.fromJson(json["tenor"]),
        angsuranPokok: json["angsuran_pokok"],
        marginPerBulan: json["margin_per_bulan"],
        angsuranPerBulan: json["angsuran_per_bulan"],
        totalAngsuran: json["total_angsuran"],
      );

  Map<String, dynamic> toJson() => {
        "product": product!.toJson(),
        "tenor": tenor!.toJson(),
        "angsuran_pokok": angsuranPokok,
        "margin_per_bulan": marginPerBulan,
        "angsuran_per_bulan": angsuranPerBulan,
        "total_angsuran": totalAngsuran,
      };
}

class Product {
  Product({
    this.id,
    this.productName,
    this.iconUrl,
    this.price,
  });

  int? id;
  String? productName;
  dynamic iconUrl;
  int? price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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

class Tenor {
  Tenor({
    this.id,
    this.caption,
  });

  int? id;
  String? caption;

  factory Tenor.fromJson(Map<String, dynamic> json) => Tenor(
        id: json["id"],
        caption: json["caption"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption,
      };
}
