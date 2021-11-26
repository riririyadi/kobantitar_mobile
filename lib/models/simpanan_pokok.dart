// To parse this JSON data, do
//
//     final simpanan = simpananFromJson(jsonString);

import 'dart:convert';

SimpananPokok simpananFromJson(String str) =>
    SimpananPokok.fromJson(json.decode(str));

String simpananToJson(SimpananPokok data) => json.encode(data.toJson());

class SimpananPokok {
  SimpananPokok({
    this.total,
    this.list,
  });

  int? total;
  ListClass? list;

  factory SimpananPokok.fromJson(Map<String, dynamic> json) => SimpananPokok(
        total: json["total"],
        list: ListClass.fromJson(json["list"]),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "list": list!.toJson(),
      };
}

class ListClass {
  ListClass({
    this.pagination,
    this.data,
  });

  Pagination? pagination;
  List<Datum>? data;

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        pagination: Pagination.fromJson(json["pagination"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination!.toJson(),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.text,
    this.amount,
    this.date,
    this.isPostive,
  });

  String? text;
  int? amount;
  String? date;
  bool? isPostive;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        text: json["text"],
        amount: json["amount"],
        date: json["date"],
        isPostive: json["is_postive"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "amount": amount,
        "date": date,
        "is_postive": isPostive,
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
