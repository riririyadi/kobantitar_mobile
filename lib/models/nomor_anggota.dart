// To parse this JSON data, do
//
//     final nomorAnggota = nomorAnggotaFromJson(jsonString);

import 'dart:convert';

NomorAnggota nomorAnggotaFromJson(String str) =>
    NomorAnggota.fromJson(json.decode(str));

String nomorAnggotaToJson(NomorAnggota data) => json.encode(data.toJson());

class NomorAnggota {
  NomorAnggota({
    this.nama,
    this.instansiId,
  });

  String? nama;
  int? instansiId;

  factory NomorAnggota.fromJson(Map<String, dynamic> json) => NomorAnggota(
        nama: json["nama"],
        instansiId: json["instansi_id"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "instansi_id": instansiId,
      };
}
