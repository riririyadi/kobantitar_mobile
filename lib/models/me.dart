// To parse this JSON data, do
//
//     final me = meFromJson(jsonString);

import 'dart:convert';

Me meFromJson(String str) => Me.fromJson(json.decode(str));

String meToJson(Me data) => json.encode(data.toJson());

class Me {
  Me({
    this.id,
    this.role,
    this.nomorAnggota,
    this.nama,
    this.jenisKelamin,
    this.nik,
    this.alamat,
    this.instansi,
    this.jabatan,
    this.nip,
    this.bank,
    this.nomorRekening,
    this.cabang,
    this.email,
    this.noHp,
    this.photoUrl,
    this.ktpUrl,
  });

  int? id;
  String? role;
  String? nomorAnggota;
  String? nama;
  String? jenisKelamin;
  String? nik;
  String? alamat;
  String? instansi;
  String? jabatan;
  String? nip;
  String? bank;
  String? nomorRekening;
  String? cabang;
  String? email;
  String? noHp;
  dynamic photoUrl;
  dynamic ktpUrl;

  factory Me.fromJson(Map<String, dynamic> json) => Me(
        id: json["id"],
        role: json["role"],
        nomorAnggota: json["nomor_anggota"],
        nama: json["nama"],
        jenisKelamin: json["jenis_kelamin"],
        nik: json["nik"],
        alamat: json["alamat"],
        instansi: json["instansi"],
        jabatan: json["jabatan"],
        nip: json["nip"],
        bank: json["bank"],
        nomorRekening: json["nomor_rekening"],
        cabang: json["cabang"],
        email: json["email"],
        noHp: json["no_hp"],
        photoUrl: json["photo_url"],
        ktpUrl: json["ktp_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "nomor_anggota": nomorAnggota,
        "nama": nama,
        "jenis_kelamin": jenisKelamin,
        "nik": nik,
        "alamat": alamat,
        "instansi": instansi,
        "jabatan": jabatan,
        "nip": nip,
        "bank": bank,
        "nomor_rekening": nomorRekening,
        "cabang": cabang,
        "email": email,
        "no_hp": noHp,
        "photo_url": photoUrl,
        "ktp_url": ktpUrl,
      };
}
