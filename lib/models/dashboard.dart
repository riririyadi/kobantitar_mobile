// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

import 'dart:convert';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

class Dashboard {
  Dashboard({
    this.success,
    this.status,
    this.data,
  });

  bool? success;
  String? status;
  Data? data;

  factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        success: json["success"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.informasi,
    this.promoImageUrl,
    this.promoProducts,
  });

  List<DataInformasi>? informasi;
  String? promoImageUrl;
  List<PromoProduct>? promoProducts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        informasi: List<DataInformasi>.from(
            json["informasi"].map((x) => DataInformasi.fromJson(x))),
        promoImageUrl: json["promo_image_url"],
        promoProducts: List<PromoProduct>.from(
            json["promo_products"].map((x) => PromoProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "informasi": List<dynamic>.from(informasi!.map((x) => x.toJson())),
        "promo_image_url": promoImageUrl,
        "promo_products":
            List<dynamic>.from(promoProducts!.map((x) => x.toJson())),
      };
}

class DataInformasi {
  DataInformasi({
    this.id,
    this.caption,
    this.backgroundUrl,
    this.backgroundColor,
    this.url,
  });

  int? id;
  String? caption;
  String? backgroundUrl;
  BackgroundColor? backgroundColor;
  String? url;

  factory DataInformasi.fromJson(Map<String, dynamic> json) => DataInformasi(
        id: json["id"],
        caption: json["caption"],
        backgroundUrl: json["background_url"],
        backgroundColor: BackgroundColor.fromJson(json["background_color"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption,
        "background_url": backgroundUrl,
        "background_color": backgroundColor!.toJson(),
        "url": url,
      };
}

class BackgroundColor {
  BackgroundColor({
    this.test,
  });

  String? test;

  factory BackgroundColor.fromJson(Map<String, dynamic> json) =>
      BackgroundColor(
        test: json["test"],
      );

  Map<String, dynamic> toJson() => {
        "test": test,
      };
}

class PromoProduct {
  PromoProduct({
    this.id,
    this.imageUrl,
    this.hargaAwal,
    this.hargaPromo,
  });

  String? id;
  String? imageUrl;
  int? hargaAwal;
  int? hargaPromo;

  factory PromoProduct.fromJson(Map<String, dynamic> json) => PromoProduct(
        id: json["id"],
        imageUrl: json["image_url"],
        hargaAwal: json["harga_awal"],
        hargaPromo: json["harga_promo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "harga_awal": hargaAwal,
        "harga_promo": hargaPromo,
      };
}
