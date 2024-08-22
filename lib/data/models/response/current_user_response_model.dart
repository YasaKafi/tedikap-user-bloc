import 'dart:convert';

class CurrentUserModel {
  Data? data;

  CurrentUserModel({
    this.data,
  });

  factory CurrentUserModel.fromJson(String str) => CurrentUserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CurrentUserModel.fromMap(Map<String, dynamic> json) => CurrentUserModel(
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
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
  dynamic whatsappNumber;
  String? whatsappService;
  String? fcmToken;

  Data({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.gender,
    this.role,
    this.whatsappNumber,
    this.whatsappService,
    this.fcmToken,
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
    whatsappNumber: json["whatsapp_number"],
    whatsappService: json["whatsapp_service"],
    fcmToken: json["fcm_token"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "email": email,
    "name": name,
    "avatar": avatar,
    "gender": gender,
    "role": role,
    "whatsapp_number": whatsappNumber,
    "whatsapp_service": whatsappService,
    "fcm_token": fcmToken,
  };
}
