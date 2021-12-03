// To parse this JSON data, do
//
//     final tagihan = tagihanFromJson(jsonString);

import 'dart:convert';

TagihanList tagihanListFromJson(String str) =>
    TagihanList.fromJson(json.decode(str));

String tagihanListToJson(TagihanList data) => json.encode(data.toJson());

class TagihanList {
  TagihanList({
    this.success,
    this.status,
    this.data,
  });

  bool? success;
  String? status;
  List<DataTagihan>? data;

  factory TagihanList.fromJson(Map<String, dynamic> json) => TagihanList(
        success: json["success"],
        status: json["status"],
        data: List<DataTagihan>.from(
            json["data"].map((x) => DataTagihan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataTagihan {
  DataTagihan({
    this.id,
    this.caption,
    this.type,
    this.sisaTagihan,
    this.sisaTenor,
    this.tagihanHarusDibayar,
    this.jatuhTempo,
    this.isLate,
  });

  int? id;
  String? caption;
  String? type;
  double? sisaTagihan;
  int? sisaTenor;
  double? tagihanHarusDibayar;
  String? jatuhTempo;
  bool? isLate;

  factory DataTagihan.fromJson(Map<String, dynamic> json) => DataTagihan(
        id: json["id"],
        caption: json["caption"],
        type: json["type"],
        sisaTagihan: json["sisa_tagihan"].toDouble(),
        sisaTenor: json["sisa_tenor"],
        tagihanHarusDibayar: json["tagihan_harus_dibayar"].toDouble(),
        jatuhTempo: json["jatuh_tempo"],
        isLate: json["is_late"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption,
        "type": type,
        "sisa_tagihan": sisaTagihan,
        "sisa_tenor": sisaTenor,
        "tagihan_harus_dibayar": tagihanHarusDibayar,
        "jatuh_tempo": jatuhTempo,
        "is_late": isLate,
      };
}
