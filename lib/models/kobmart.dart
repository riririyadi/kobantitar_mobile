// To parse this JSON data, do
//
//     final kobmart = kobmartFromJson(jsonString);

import 'dart:convert';

import 'package:kobantitar_mobile/models/dashboard.dart';

Kobmart kobmartFromJson(String str) => Kobmart.fromJson(json.decode(str));

String kobmartToJson(Kobmart data) => json.encode(data.toJson());

class Kobmart {
  Kobmart({
    this.success,
    this.status,
    this.data,
  });

  bool? success;
  String? status;
  DataKobmart? data;

  factory Kobmart.fromJson(Map<String, dynamic> json) => Kobmart(
        success: json["success"],
        status: json["status"],
        data: DataKobmart.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "data": data!.toJson(),
      };
}

class DataKobmart {
  DataKobmart({
    this.promoImageUrl,
    this.promoProducts,
  });

  String? promoImageUrl;
  List<PromoProduct>? promoProducts;

  factory DataKobmart.fromJson(Map<String, dynamic> json) => DataKobmart(
        promoImageUrl: json["promo_image_url"],
        promoProducts: List<PromoProduct>.from(
            json["promo_products"].map((x) => PromoProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "promo_image_url": promoImageUrl,
        "promo_products":
            List<dynamic>.from(promoProducts!.map((x) => x.toJson())),
      };
}

