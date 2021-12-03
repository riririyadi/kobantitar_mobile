// To parse this JSON data, do
//
//     final notifikasi = notifikasiFromJson(jsonString);

import 'dart:convert';

Notifikasi notifikasiFromJson(String str) =>
    Notifikasi.fromJson(json.decode(str));

String notifikasiToJson(Notifikasi data) => json.encode(data.toJson());

class Notifikasi {
  Notifikasi({
    this.success,
    this.status,
    this.data,
  });

  bool? success;
  String? status;
  List<NotifikasiData>? data;

  factory Notifikasi.fromJson(Map<String, dynamic> json) => Notifikasi(
        success: json["success"],
        status: json["status"],
        data: List<NotifikasiData>.from(
            json["data"].map((x) => NotifikasiData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class NotifikasiData {
  NotifikasiData({
    this.title,
    this.body,
    this.id,
    this.datetime,
  });

  String? title;
  String? body;
  String? id;
  String? datetime;

  factory NotifikasiData.fromJson(Map<String, dynamic> json) => NotifikasiData(
        title: json["title"],
        body: json["body"],
        id: json["id"],
        datetime: json["datetime"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "id": id,
        "datetime": datetime,
      };
}
