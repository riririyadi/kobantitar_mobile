// To parse this JSON data, do
//
//     final dataSimpananPokok = dataSimpananPokokFromJson(jsonString);

import 'dart:convert';

List<DataSimpananPokok> dataSimpananPokokFromJson(String str) =>
    List<DataSimpananPokok>.from(
        json.decode(str).map((x) => DataSimpananPokok.fromJson(x)));

String dataSimpananPokokToJson(List<DataSimpananPokok> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataSimpananPokok {
  DataSimpananPokok({
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

  factory DataSimpananPokok.fromJson(Map<String, dynamic> json) =>
      DataSimpananPokok(
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
