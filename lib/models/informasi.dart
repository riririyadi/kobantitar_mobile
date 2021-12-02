// To parse this JSON data, do
//
//     final informasi = informasiFromJson(jsonString);

import 'dart:convert';

Informasi informasiFromJson(String str) => Informasi.fromJson(json.decode(str));

String informasiToJson(Informasi data) => json.encode(data.toJson());

class Informasi {
  Informasi({
    this.success,
    this.status,
    this.data,
  });

  bool? success;
  String? status;
  List<Datum>? data;

  factory Informasi.fromJson(Map<String, dynamic> json) => Informasi(
        success: json["success"],
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
