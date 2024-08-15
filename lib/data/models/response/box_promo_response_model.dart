import 'dart:convert';

class BoxPromoResponseModel {
  Data? data;

  BoxPromoResponseModel({
    this.data,
  });

  factory BoxPromoResponseModel.fromJson(String str) => BoxPromoResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BoxPromoResponseModel.fromMap(Map<String, dynamic> json) => BoxPromoResponseModel(
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "data": data?.toMap(),
  };
}

class Data {
  The1? the1;

  Data({
    this.the1,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    the1: json["1"] == null ? null : The1.fromMap(json["1"]),
  );

  Map<String, dynamic> toMap() => {
    "1": the1?.toMap(),
  };
}

class The1 {
  int? id;
  String? title;
  String? subtitle;
  String? image;

  The1({
    this.id,
    this.title,
    this.subtitle,
    this.image,
  });

  factory The1.fromJson(String str) => The1.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory The1.fromMap(Map<String, dynamic> json) => The1(
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
