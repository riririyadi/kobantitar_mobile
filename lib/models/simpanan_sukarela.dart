// To parse this JSON data, do
//
//     final dataSimpananSukarela = dataSimpananSukarelaFromJson(jsonString);

import 'dart:convert';

List<DataSimpananSukarela> dataSimpananSukarelaFromJson(String str) =>
    List<DataSimpananSukarela>.from(
        json.decode(str).map((x) => DataSimpananSukarela.fromJson(x)));

List<DataSimpananSukarela> dataSimpananSukarelaFromMap(
        List<Map<String, dynamic>> json) =>
    List<DataSimpananSukarela>.from(
        json.map((x) => DataSimpananSukarela.fromJson(x)));

String dataSimpananSukarelaToJson(List<DataSimpananSukarela> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataSimpananSukarela {
  DataSimpananSukarela({
    this.text,
    this.description,
    this.date,
    this.amount,
    this.isPositive,
  });

  String? text;
  dynamic? description;
  String? date;
  int? amount;
  bool? isPositive;

  factory DataSimpananSukarela.fromJson(Map<String, dynamic> json) =>
      DataSimpananSukarela(
        text: json["text"],
        description: json["description"],
        date: json["date"],
        amount: json["amount"],
        isPositive: json["is_positive"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "description": description,
        "date": date,
        "amount": amount,
        "is_positive": isPositive,
      };
}
