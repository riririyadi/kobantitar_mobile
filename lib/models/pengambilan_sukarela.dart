// To parse this JSON data, do
//
//     final pengambilanSukarela = pengambilanSukarelaFromJson(jsonString);

import 'dart:convert';

PengambilanSukarela pengambilanSukarelaFromJson(String str) =>
    PengambilanSukarela.fromJson(json.decode(str));

String pengambilanSukarelaToJson(PengambilanSukarela data) =>
    json.encode(data.toJson());

class PengambilanSukarela {
  PengambilanSukarela({
    this.list,
  });

  ListClass? list;

  factory PengambilanSukarela.fromJson(Map<String, dynamic> json) =>
      PengambilanSukarela(
        list: ListClass.fromJson(json["list"]),
      );

  Map<String, dynamic> toJson() => {
        "list": list!.toJson(),
      };
}

class ListClass {
  ListClass({
    this.pagination,
    this.data,
  });

  Pagination? pagination;
  Data? data;

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        pagination: Pagination.fromJson(json["pagination"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination!.toJson(),
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.text,
    this.amount,
    this.date,
    this.status,
    this.statusText,
  });

  String? text;
  int? amount;
  String? date;
  String? status;
  String? statusText;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        text: json["text"],
        amount: json["amount"],
        date: json["date"],
        status: json["status"],
        statusText: json["status_text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "amount": amount,
        "date": date,
        "status": status,
        "status_text": statusText,
      };
}

class Pagination {
  Pagination({
    this.objectCount,
    this.pageNumber,
    this.pageSize,
    this.pageCount,
    this.hasMoreItem,
  });

  int? objectCount;
  int? pageNumber;
  int? pageSize;
  int? pageCount;
  bool? hasMoreItem;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        objectCount: json["object_count"],
        pageNumber: json["page_number"],
        pageSize: json["page_size"],
        pageCount: json["page_count"],
        hasMoreItem: json["has_more_item"],
      );

  Map<String, dynamic> toJson() => {
        "object_count": objectCount,
        "page_number": pageNumber,
        "page_size": pageSize,
        "page_count": pageCount,
        "has_more_item": hasMoreItem,
      };
}
