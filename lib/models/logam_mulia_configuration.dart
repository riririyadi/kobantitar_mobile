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
    this.featuredAmountIds,
    this.amounts,
    this.tenors,
    this.termsUrl,
  });

  List<int>? featuredAmountIds;
  List<Amount>? amounts;
  List<Tenor>? tenors;
  String? termsUrl;

  factory LogamMuliaConfiguration.fromJson(Map<String, dynamic> json) =>
      LogamMuliaConfiguration(
        featuredAmountIds:
            List<int>.from(json["featured_amount_ids"].map((x) => x)),
        amounts:
            List<Amount>.from(json["amounts"].map((x) => Amount.fromJson(x))),
        tenors: List<Tenor>.from(json["tenors"].map((x) => Tenor.fromJson(x))),
        termsUrl: json["terms_url"],
      );

  Map<String, dynamic> toJson() => {
        "featured_amount_ids":
            List<dynamic>.from(featuredAmountIds!.map((x) => x)),
        "amounts": List<dynamic>.from(amounts!.map((x) => x.toJson())),
        "tenors": List<dynamic>.from(tenors!.map((x) => x.toJson())),
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
  int? weight;

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        id: json["id"],
        amount: json["amount"],
        caption: json["caption"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "caption": caption,
        "weight": weight,
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
