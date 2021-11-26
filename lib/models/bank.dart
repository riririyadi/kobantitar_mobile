// To parse this JSON data, do
//
//     final bank = bankFromJson(jsonString);

import 'dart:convert';

List<Bank> bankFromJson(String str) =>
    List<Bank>.from(json.decode(str).map((x) => Bank.fromJson(x)));

String bankToJson(List<Bank> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bank {
  Bank({
    this.id,
    this.name,
    this.code,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? code;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
