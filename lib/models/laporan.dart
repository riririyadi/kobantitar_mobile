// To parse this JSON data, do
//
//     final laporan = laporanFromJson(jsonString);

import 'dart:convert';

Laporan laporanFromJson(String str) => Laporan.fromJson(json.decode(str));

String laporanToJson(Laporan data) => json.encode(data.toJson());

class Laporan {
  Laporan({
    this.tahun,
    this.bulan,
    this.laporanUrl,
  });

  int? tahun;
  int? bulan;
  String? laporanUrl;

  factory Laporan.fromJson(Map<String, dynamic> json) => Laporan(
        tahun: json["tahun"],
        bulan: json["bulan"],
        laporanUrl: json["laporan_url"],
      );

  Map<String, dynamic> toJson() => {
        "tahun": tahun,
        "bulan": bulan,
        "laporan_url": laporanUrl,
      };
}
