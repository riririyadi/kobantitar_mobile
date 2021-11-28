// To parse this JSON DataConfig, do
//
//     final kreditKendaraanConfiguration = kreditKendaraanConfigurationFromJson(jsonString);

import 'dart:convert';

KreditKendaraanConfiguration kreditKendaraanConfigurationFromJson(String str) =>
    KreditKendaraanConfiguration.fromJson(json.decode(str));

String kreditKendaraanConfigurationToJson(KreditKendaraanConfiguration data) =>
    json.encode(data.toJson());

class KreditKendaraanConfiguration {
  KreditKendaraanConfiguration({
    this.success,
    this.status,
    this.data,
  });

  bool? success;
  String? status;
  DataConfig? data;

  factory KreditKendaraanConfiguration.fromJson(Map<String, dynamic> json) =>
      KreditKendaraanConfiguration(
        success: json["success"],
        status: json["status"],
        data: DataConfig.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "data": data!.toJson(),
      };
}

class DataConfig {
  DataConfig({
    this.tenors,
    this.brands,
    this.termsUrl,
  });

  List<Tenor>? tenors;
  List<Brand>? brands;
  dynamic termsUrl;

  factory DataConfig.fromJson(Map<String, dynamic> json) => DataConfig(
        tenors: List<Tenor>.from(json["tenors"].map((x) => Tenor.fromJson(x))),
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
        termsUrl: json["terms_url"],
      );

  Map<String, dynamic> toJson() => {
        "tenors": List<dynamic>.from(tenors!.map((x) => x.toJson())),
        "brands": List<dynamic>.from(brands!.map((x) => x.toJson())),
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
  dynamic iconUrl;

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