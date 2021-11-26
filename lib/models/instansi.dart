// To parse this JSON data, do
//
//     final instansi = instansiFromJson(jsonString);

import 'dart:convert';

List<Instansi> instansiFromJson(String str) =>
    List<Instansi>.from(json.decode(str).map((x) => Instansi.fromJson(x)));

String instansiToJson(List<Instansi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Instansi {
  Instansi({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Instansi.fromJson(Map<String, dynamic> json) => Instansi(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
