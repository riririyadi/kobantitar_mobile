// To parse this JSON data, do
//
//     final barangLainCalculation = barangLainCalculationFromJson(jsonString);

import 'dart:convert';

BarangLainCalculation barangLainCalculationFromJson(String str) =>
    BarangLainCalculation.fromJson(json.decode(str));

String barangLainCalculationToJson(BarangLainCalculation data) =>
    json.encode(data.toJson());

class BarangLainCalculation {
  BarangLainCalculation({
    this.success,
    this.status,
    this.data,
  });

  bool? success;
  String? status;
  DataConfigBarang? data;

  factory BarangLainCalculation.fromJson(Map<String, dynamic> json) =>
      BarangLainCalculation(
        success: json["success"],
        status: json["status"],
        data: DataConfigBarang.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "data": data!.toJson(),
      };
}

class DataConfigBarang {
  DataConfigBarang({
    this.nominal,
    this.tenor,
    this.angsuranPokok,
    this.marginPerBulan,
    this.angsuranPerBulan,
    this.totalAngsuran,
  });

  String? nominal;
  Tenor? tenor;
  int? angsuranPokok;
  int? marginPerBulan;
  int? angsuranPerBulan;
  int? totalAngsuran;

  factory DataConfigBarang.fromJson(Map<String, dynamic> json) =>
      DataConfigBarang(
        nominal: json["nominal"],
        tenor: Tenor.fromJson(json["tenor"]),
        angsuranPokok: json["angsuran_pokok"],
        marginPerBulan: json["margin_per_bulan"],
        angsuranPerBulan: json["angsuran_per_bulan"],
        totalAngsuran: json["total_angsuran"],
      );

  Map<String, dynamic> toJson() => {
        "nominal": nominal,
        "tenor": tenor!.toJson(),
        "angsuran_pokok": angsuranPokok,
        "margin_per_bulan": marginPerBulan,
        "angsuran_per_bulan": angsuranPerBulan,
        "total_angsuran": totalAngsuran,
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
