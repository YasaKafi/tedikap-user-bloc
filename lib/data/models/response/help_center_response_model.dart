import 'dart:convert';

class HelpCenterResponseModel {
  List<Datum>? data;

  HelpCenterResponseModel({
    this.data,
  });

  factory HelpCenterResponseModel.fromJson(String str) => HelpCenterResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HelpCenterResponseModel.fromMap(Map<String, dynamic> json) => HelpCenterResponseModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datum {
  int? id;
  String? title;
  String? subtitle;

  Datum({
    this.id,
    this.title,
    this.subtitle,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
  };
}
