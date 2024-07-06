import 'dart:convert';

class LoginResponseModel {
  String? message;
  Data? data;
  String? token;

  LoginResponseModel({
    this.message,
    this.data,
    this.token,
  });

  factory LoginResponseModel.fromJson(String str) => LoginResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromMap(Map<String, dynamic> json) => LoginResponseModel(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "data": data?.toMap(),
    "token": token,
  };
}

class Data {
  int? id;
  String? email;
  String? name;
  String? avatar;
  String? gender;
  String? role;

  Data({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.gender,
    this.role,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    avatar: json["avatar"],
    gender: json["gender"],
    role: json["role"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "email": email,
    "name": name,
    "avatar": avatar,
    "gender": gender,
    "role": role,
  };
}
