import 'dart:convert';

class EditProfileResponseModel {
  String? message;
  Data? data;

  EditProfileResponseModel({
    this.message,
    this.data,
  });

  factory EditProfileResponseModel.fromJson(String str) => EditProfileResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EditProfileResponseModel.fromMap(Map<String, dynamic> json) => EditProfileResponseModel(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "data": data?.toMap(),
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
