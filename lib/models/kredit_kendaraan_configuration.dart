// To parse this JSON data, do
//
//     final kreditKendaraanConfiguration = kreditKendaraanConfigurationFromJson(jsonString);

import 'dart:convert';

KreditKendaraanConfiguration kreditKendaraanConfigurationFromJson(String str) =>
    KreditKendaraanConfiguration.fromJson(json.decode(str));

String kreditKendaraanConfigurationToJson(KreditKendaraanConfiguration data) =>
    json.encode(data.toJson());

class KreditKendaraanConfiguration {
  KreditKendaraanConfiguration({
    this.brands,
    this.tenors,
    this.termsUrl,
  });

  List<Brand>? brands;
  List<Tenor>? tenors;
  String? termsUrl;

  factory KreditKendaraanConfiguration.fromJson(Map<String, dynamic> json) =>
      KreditKendaraanConfiguration(
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
        tenors: List<Tenor>.from(json["tenors"].map((x) => Tenor.fromJson(x))),
        termsUrl: json["terms_url"],
      );

  Map<String, dynamic> toJson() => {
        "brands": List<dynamic>.from(brands!.map((x) => x.toJson())),
        "tenors": List<dynamic>.from(tenors!.map((x) => x.toJson())),
        "terms_url": termsUrl,
      };
}

class Brand {
  Brand({
    this.id,
    this.brand,
    this.iconUrl,
  });

  int? id;
  String? brand;
  String? iconUrl;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
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
