// To parse this JSON data, do
//
//     final pengajuan = pengajuanFromJson(jsonString);

import 'dart:convert';

PengajuanList pengajuanListFromJson(String str) =>
    PengajuanList.fromJson(json.decode(str));

String pengajuanListToJson(PengajuanList data) => json.encode(data.toJson());

class PengajuanList {
  PengajuanList({
    this.success,
    this.status,
    this.data,
  });

  bool? success;
  String? status;
  List<DataPengajuan>? data;

  factory PengajuanList.fromJson(Map<String, dynamic> json) => PengajuanList(
        success: json["success"],
        status: json["status"],
        data: List<DataPengajuan>.from(
            json["data"].map((x) => DataPengajuan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataPengajuan {
  DataPengajuan({
    this.id,
    this.caption,
    this.type,
    this.totalAngsuran,
    this.angsuranPerBulan,
    this.tenor,
    this.status,
    this.keterangan,
  });

  int? id;
  String? caption;
  String? type;
  double? totalAngsuran;
  double? angsuranPerBulan;
  String? tenor;
  String? status;
  String? keterangan;

  factory DataPengajuan.fromJson(Map<String, dynamic> json) => DataPengajuan(
        id: json["id"],
        caption: json["caption"],
        type: json["type"],
        totalAngsuran: json["total_angsuran"].toDouble(),
        angsuranPerBulan: json["angsuran_per_bulan"].toDouble(),
        tenor: json["tenor"],
        status: json["status"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption,
        "type": type,
        "total_angsuran": totalAngsuran,
        "angsuran_per_bulan": angsuranPerBulan,
        "tenor": tenor,
        "status": status,
        "keterangan": keterangan,
      };
}
