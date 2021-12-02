// To parse this JSON data, do
//
//     final kontak = kontakFromJson(jsonString);

import 'dart:convert';

Kontak kontakFromJson(String str) => Kontak.fromJson(json.decode(str));

String kontakToJson(Kontak data) => json.encode(data.toJson());

class Kontak {
  Kontak({
    this.success,
    this.status,
    this.data,
  });

  bool? success;
  String? status;
  Data? data;

  factory Kontak.fromJson(Map<String, dynamic> json) => Kontak(
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
    this.contactUrl,
    this.faqUrl,
  });

  ContactUrl? contactUrl;
  FaqUrl? faqUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        contactUrl: ContactUrl.fromJson(json["contact_url"]),
        faqUrl: FaqUrl.fromJson(json["faq_url"]),
      );

  Map<String, dynamic> toJson() => {
        "contact_url": contactUrl!.toJson(),
        "faq_url": faqUrl!.toJson(),
      };
}

class ContactUrl {
  ContactUrl({
    this.telepon,
    this.email,
    this.whatsapp,
  });

  String? telepon;
  String? email;
  String? whatsapp;

  factory ContactUrl.fromJson(Map<String, dynamic> json) => ContactUrl(
        telepon: json["telepon"],
        email: json["email"],
        whatsapp: json["whatsapp"],
      );

  Map<String, dynamic> toJson() => {
        "telepon": telepon,
        "email": email,
        "whatsapp": whatsapp,
      };
}

class FaqUrl {
  FaqUrl({
    this.logamMulia,
    this.kreditBarang,
    this.simulasiShu,
    this.laporanKeuangan,
    this.kobantitarMart,
  });

  String? logamMulia;
  String? kreditBarang;
  String? simulasiShu;
  String? laporanKeuangan;
  String? kobantitarMart;

  factory FaqUrl.fromJson(Map<String, dynamic> json) => FaqUrl(
        logamMulia: json["logam_mulia"],
        kreditBarang: json["kredit_barang"],
        simulasiShu: json["simulasi_shu"],
        laporanKeuangan: json["laporan_keuangan"],
        kobantitarMart: json["kobantitar_mart"],
      );

  Map<String, dynamic> toJson() => {
        "logam_mulia": logamMulia,
        "kredit_barang": kreditBarang,
        "simulasi_shu": simulasiShu,
        "laporan_keuangan": laporanKeuangan,
        "kobantitar_mart": kobantitarMart,
      };
}
