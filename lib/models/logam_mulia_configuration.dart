// To parse this JSON data, do
//
//     final logamMuliaConfiguration = logamMuliaConfigurationFromJson(jsonString);

import 'dart:convert';

LogamMuliaConfiguration logamMuliaConfigurationFromJson(String str) =>
    LogamMuliaConfiguration.fromJson(json.decode(str));

String logamMuliaConfigurationToJson(LogamMuliaConfiguration data) =>
    json.encode(data.toJson());

class LogamMuliaConfiguration {
  LogamMuliaConfiguration({
    this.success,
    this.status,
    this.data,
  });

  bool? success;
  String? status;
  Data? data;

  factory LogamMuliaConfiguration.fromJson(Map<String, dynamic> json) =>
      LogamMuliaConfiguration(
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
    this.featuredAmountIds,
    this.amounts,
    this.tenors,
    this.isDoubleApproval,
    this.termsUrl,
  });

  List<int>? featuredAmountIds;
  List<Amount>? amounts;
  List<TenorLogamMulia>? tenors;
  bool? isDoubleApproval;
  dynamic termsUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        featuredAmountIds:
            List<int>.from(json["featured_amount_ids"].map((x) => x)),
        amounts:
            List<Amount>.from(json["amounts"].map((x) => Amount.fromJson(x))),
        tenors: List<TenorLogamMulia>.from(
            json["tenors"].map((x) => TenorLogamMulia.fromJson(x))),
        isDoubleApproval: json["is_double_approval"],
        termsUrl: json["terms_url"],
      );

  Map<String, dynamic> toJson() => {
        "featured_amount_ids":
            List<dynamic>.from(featuredAmountIds!.map((x) => x)),
        "amounts": List<dynamic>.from(amounts!.map((x) => x.toJson())),
        "tenors": List<dynamic>.from(tenors!.map((x) => x.toJson())),
        "is_double_approval": isDoubleApproval,
        "terms_url": termsUrl,
      };
}

class Amount {
  Amount({
    this.id,
    this.amount,
    this.caption,
    this.weight,
  });

  int? id;
  int? amount;
  String? caption;
  double? weight;

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        id: json["id"],
        amount: json["amount"],
        caption: json["caption"],
        weight: json["weight"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "caption": caption,
        "weight": weight,
      };
}

class TenorLogamMulia {
  TenorLogamMulia({
    this.id,
    this.caption,
  });

  int? id;
  String? caption;

  factory TenorLogamMulia.fromJson(Map<String, dynamic> json) =>
      TenorLogamMulia(
        id: json["id"],
        caption: json["caption"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption,
      };
}
