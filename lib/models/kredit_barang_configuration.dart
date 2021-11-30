// To parse this JSON data, do
//
//     final barangLainConfig = barangLainConfigFromJson(jsonString);

import 'dart:convert';

BarangLainConfig barangLainConfigFromJson(String str) =>
    BarangLainConfig.fromJson(json.decode(str));

String barangLainConfigToJson(BarangLainConfig data) =>
    json.encode(data.toJson());

class BarangLainConfig {
  BarangLainConfig({
    this.success,
    this.status,
    this.data,
  });

  bool? success;
  String? status;
  Data? data;

  factory BarangLainConfig.fromJson(Map<String, dynamic> json) =>
      BarangLainConfig(
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
    this.minPrice,
    this.maxPrice,
    this.tenors,
    this.termsUrl,
  });

  int? minPrice;
  int? maxPrice;
  List<TenorBarang>? tenors;
  dynamic termsUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        minPrice: json["min_price"],
        maxPrice: json["max_price"],
        tenors: List<TenorBarang>.from(
            json["tenors"].map((x) => TenorBarang.fromJson(x))),
        termsUrl: json["terms_url"],
      );

  Map<String, dynamic> toJson() => {
        "min_price": minPrice,
        "max_price": maxPrice,
        "tenors": List<dynamic>.from(tenors!.map((x) => x.toJson())),
        "terms_url": termsUrl,
      };
}

class TenorBarang {
  TenorBarang({
    this.id,
    this.caption,
  });

  int? id;
  String? caption;

  factory TenorBarang.fromJson(Map<String, dynamic> json) => TenorBarang(
        id: json["id"],
        caption: json["caption"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption,
      };
}
