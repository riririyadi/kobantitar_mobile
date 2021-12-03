// To parse this JSON data, do
//
//     final detailDataPengajuan = detailDataPengajuanFromJson(jsonString);

import 'dart:convert';

DetailDataPengajuan detailDataPengajuanFromJson(String str) =>
    DetailDataPengajuan.fromJson(json.decode(str));

String detailPengajuanToJson(DetailDataPengajuan data) =>
    json.encode(data.toJson());

class DetailDataPengajuan {
  DetailDataPengajuan({
    this.success,
    this.status,
    this.data,
  });

  bool? success;
  String? status;
  Data? data;

  factory DetailDataPengajuan.fromJson(Map<String, dynamic> json) =>
      DetailDataPengajuan(
        success: json["success"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.sisaTagihan,
    this.pengajuan,
    this.riwayat,
    this.tagihan,
  });

  double? sisaTagihan;
  Pengajuan? pengajuan;
  List<Riwayat>? riwayat;
  List<Tagihan>? tagihan;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sisaTagihan: json["sisa_tagihan"],
        pengajuan: Pengajuan.fromJson(json["pengajuan"]),
        riwayat:
            List<Riwayat>.from(json["riwayat"].map((x) => Riwayat.fromJson(x))),
        tagihan:
            List<Tagihan>.from(json["tagihan"].map((x) => Tagihan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sisa_tagihan": sisaTagihan,
        "pengajuan": pengajuan!.toJson(),
        "riwayat": List<dynamic>.from(riwayat!.map((x) => x.toJson())),
        "tagihan": List<dynamic>.from(tagihan!.map((x) => x.toJson())),
      };
}

class Pengajuan {
  Pengajuan({
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

  factory Pengajuan.fromJson(Map<String, dynamic> json) => Pengajuan(
        id: json["id"],
        caption: json["caption"],
        type: json["type"],
        totalAngsuran: json["total_angsuran"],
        angsuranPerBulan: json["angsuran_per_bulan"],
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

class Riwayat {
  Riwayat({
    this.caption,
    this.date,
  });

  String? caption;
  String? date;

  factory Riwayat.fromJson(Map<String, dynamic> json) => Riwayat(
        caption: json["caption"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "caption": caption,
        "date": date,
      };
}

class Tagihan {
  Tagihan({
    this.caption,
    this.amount,
    this.status,
    this.date,
  });

  String? caption;
  double? amount;
  Status? status;
  String? date;

  factory Tagihan.fromJson(Map<String, dynamic> json) => Tagihan(
        caption: json["caption"],
        amount: json["amount"].toDouble(),
        status: statusValues.map![json["status"]],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "caption": caption,
        "amount": amount,
        "status": statusValues.reverse![status],
        "date": date,
      };
}

enum Status { UNPAID, PAID }

final statusValues = EnumValues({"PAID": Status.PAID, "UNPAID": Status.UNPAID});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
