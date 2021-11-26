// To parse this JSON data, do
//
//     final simpanan = simpananFromJson(jsonString);

import 'dart:convert';

Simpanan simpananFromJson(String str) => Simpanan.fromJson(json.decode(str));

String simpananToJson(Simpanan data) => json.encode(data.toJson());

class Simpanan {
  Simpanan({
    this.total,
    this.pokok,
    this.wajib,
    this.sukarela,
  });

  int? total;
  int? pokok;
  int? wajib;
  int? sukarela;

  factory Simpanan.fromJson(Map<String, dynamic> json) => Simpanan(
        total: json["total"],
        pokok: json["pokok"],
        wajib: json["wajib"],
        sukarela: json["sukarela"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "pokok": pokok,
        "wajib": wajib,
        "sukarela": sukarela,
      };
}
