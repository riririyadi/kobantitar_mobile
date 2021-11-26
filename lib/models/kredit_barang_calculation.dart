// To parse this JSON data, do
//
//     final kreditBarangCalculation = kreditBarangCalculationFromJson(jsonString);

import 'dart:convert';

KreditBarangCalculation kreditBarangCalculationFromJson(String str) =>
    KreditBarangCalculation.fromJson(json.decode(str));

String kreditBarangCalculationToJson(KreditBarangCalculation data) =>
    json.encode(data.toJson());

class KreditBarangCalculation {
  KreditBarangCalculation({
    this.angsuranPokok,
    this.marginPerBulan,
    this.angsuranPerBulan,
    this.totalAngsuran,
  });

  int? angsuranPokok;
  int? marginPerBulan;
  int? angsuranPerBulan;
  int? totalAngsuran;

  factory KreditBarangCalculation.fromJson(Map<String, dynamic> json) =>
      KreditBarangCalculation(
        angsuranPokok: json["angsuran_pokok"],
        marginPerBulan: json["margin_per_bulan"],
        angsuranPerBulan: json["angsuran_per_bulan"],
        totalAngsuran: json["total_angsuran"],
      );

  Map<String, dynamic> toJson() => {
        "angsuran_pokok": angsuranPokok,
        "margin_per_bulan": marginPerBulan,
        "angsuran_per_bulan": angsuranPerBulan,
        "total_angsuran": totalAngsuran,
      };
}
