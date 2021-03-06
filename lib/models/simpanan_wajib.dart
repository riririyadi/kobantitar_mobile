// To parse this JSON data, do
//
//     final dataSimpananWajib = dataSimpananWajibFromJson(jsonString);

import 'dart:convert';

List<DataSimpananWajib> dataSimpananWajibFromJson(String str) =>
    List<DataSimpananWajib>.from(
        json.decode(str).map((x) => DataSimpananWajib.fromJson(x)));

String dataSimpananWajibToJson(List<DataSimpananWajib> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataSimpananWajib {
  DataSimpananWajib({
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

  factory DataSimpananWajib.fromJson(Map<String, dynamic> json) =>
      DataSimpananWajib(
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
