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
    this.tenors,
    this.termsUrl,
  });

  List<Tenor>? tenors;
  String? termsUrl;

  factory KreditBarangConfiguration.fromJson(Map<String, dynamic> json) =>
      KreditBarangConfiguration(
        tenors: List<Tenor>.from(json["tenors"].map((x) => Tenor.fromJson(x))),
        termsUrl: json["terms_url"],
      );

  Map<String, dynamic> toJson() => {
        "tenors": List<dynamic>.from(tenors!.map((x) => x.toJson())),
        "terms_url": termsUrl,
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
