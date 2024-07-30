import 'dart:convert';

class UserPointResponseModel {
  List<Data>? data;

  UserPointResponseModel({
    this.data,
  });

  factory UserPointResponseModel.fromJson(String str) => UserPointResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserPointResponseModel.fromMap(Map<String, dynamic> json) => UserPointResponseModel(
    data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Data {
  int? userId;
  int? point;

  Data({
    this.userId,
    this.point,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    point: json["point"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "point": point,
  };
}
