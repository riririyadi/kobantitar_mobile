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
    this.isDoubleApproval,
    this.termsUrl,
  });

  List<TenorConfig>? tenors;
  List<Brand>? brands;
  bool? isDoubleApproval;
  dynamic termsUrl;

  factory DataConfig.fromJson(Map<String, dynamic> json) => DataConfig(
        tenors: List<TenorConfig>.from(
            json["tenors"].map((x) => TenorConfig.fromJson(x))),
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
        isDoubleApproval: json["is_double_approval"],
        termsUrl: json["terms_url"],
      );

  Map<String, dynamic> toJson() => {
        "tenors": List<dynamic>.from(tenors!.map((x) => x.toJson())),
        "brands": List<dynamic>.from(brands!.map((x) => x.toJson())),
        "is_double_approval": isDoubleApproval,
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

class TenorConfig {
  TenorConfig({
    this.id,
    this.caption,
  });

  int? id;
  String? caption;

  factory TenorConfig.fromJson(Map<String, dynamic> json) => TenorConfig(
        id: json["id"],
        caption: json["caption"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption,
      };
}
