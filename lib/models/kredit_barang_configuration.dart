// To parse this JSON data, do
//
//     final kreditBarangConfiguration = kreditBarangConfigurationFromJson(jsonString);

import 'dart:convert';

KreditBarangConfiguration kreditBarangConfigurationFromJson(String str) =>
    KreditBarangConfiguration.fromJson(json.decode(str));

String kreditBarangConfigurationToJson(KreditBarangConfiguration data) =>
    json.encode(data.toJson());

class KreditBarangConfiguration {
  KreditBarangConfiguration({
    this.success,
    this.status,
    this.data,
  });

  bool? success;
  String? status;
  Data? data;

  factory KreditBarangConfiguration.fromJson(Map<String, dynamic> json) =>
      KreditBarangConfiguration(
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
    this.isDoubleApproval,
    this.termsUrl,
  });

  int? minPrice;
  int? maxPrice;
  List<TenorBarang>? tenors;
  bool? isDoubleApproval;
  dynamic termsUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        minPrice: json["min_price"],
        maxPrice: json["max_price"],
        tenors: List<TenorBarang>.from(
            json["tenors"].map((x) => TenorBarang.fromJson(x))),
        isDoubleApproval: json["is_double_approval"],
        termsUrl: json["terms_url"],
      );

  Map<String, dynamic> toJson() => {
        "min_price": minPrice,
        "max_price": maxPrice,
        "tenors": List<dynamic>.from(tenors!.map((x) => x.toJson())),
        "is_double_approval": isDoubleApproval,
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
