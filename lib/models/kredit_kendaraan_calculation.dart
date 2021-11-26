// To parse this JSON data, do
//
//     final kreditKendaraanCalculation = kreditKendaraanCalculationFromJson(jsonString);

import 'dart:convert';

KreditKendaraanCalculation kreditKendaraanCalculationFromJson(String str) => KreditKendaraanCalculation.fromJson(json.decode(str));

String kreditKendaraanCalculationToJson(KreditKendaraanCalculation data) => json.encode(data.toJson());

class KreditKendaraanCalculation {
    KreditKendaraanCalculation({
        this.angsuranPokok,
        this.marginPerBulan,
        this.angsuranPerBulan,
        this.totalAngsuran,
    });

    int? angsuranPokok;
    int? marginPerBulan;
    int? angsuranPerBulan;
    int? totalAngsuran;

    factory KreditKendaraanCalculation.fromJson(Map<String, dynamic> json) => KreditKendaraanCalculation(
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
