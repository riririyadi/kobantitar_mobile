// To parse this JSON data, do
//
//     final logamMuliaCalculation = logamMuliaCalculationFromJson(jsonString);

import 'dart:convert';

LogamMuliaCalculation logamMuliaCalculationFromJson(String str) =>
    LogamMuliaCalculation.fromJson(json.decode(str));

String logamMuliaCalculationToJson(LogamMuliaCalculation data) =>
    json.encode(data.toJson());

class LogamMuliaCalculation {
  LogamMuliaCalculation({
    this.amount,
    this.tenor,
    this.angsuranPokok,
    this.marginPerBulan,
    this.angsuranPerBulan,
    this.totalAngsuran,
  });

  Amount? amount;
  Tenor? tenor;
  int? angsuranPokok;
  int? marginPerBulan;
  int? angsuranPerBulan;
  int? totalAngsuran;

  factory LogamMuliaCalculation.fromJson(Map<String, dynamic> json) =>
      LogamMuliaCalculation(
        amount: Amount.fromJson(json["amount"]),
        tenor: Tenor.fromJson(json["tenor"]),
        angsuranPokok: json["angsuran_pokok"],
        marginPerBulan: json["margin_per_bulan"],
        angsuranPerBulan: json["angsuran_per_bulan"],
        totalAngsuran: json["total_angsuran"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount!.toJson(),
        "tenor": tenor!.toJson(),
        "angsuran_pokok": angsuranPokok,
        "margin_per_bulan": marginPerBulan,
        "angsuran_per_bulan": angsuranPerBulan,
        "total_angsuran": totalAngsuran,
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
