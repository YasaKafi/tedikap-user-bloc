import 'dart:convert';

class BoxPromoResponseModel {
  Map<String, Datum>? data;

  BoxPromoResponseModel({
    this.data,
  });

  factory BoxPromoResponseModel.fromJson(String str) => BoxPromoResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BoxPromoResponseModel.fromMap(Map<String, dynamic> json) => BoxPromoResponseModel(
    data: Map.from(json["data"]!).map((k, v) => MapEntry<String, Datum>(k, Datum.fromMap(v))),
  );

  Map<String, dynamic> toMap() => {
    "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
  };
}

class Datum {
  int? id;
  String? title;
  String? subtitle;
  String? image;

  Datum({
    this.id,
    this.title,
    this.subtitle,
    this.image,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "image": image,
  };
}
