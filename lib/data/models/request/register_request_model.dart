import 'dart:convert';

class RegisterRequestModel {
  String? name;
  String? email;
  String? password;
  String? fcmToken;

  RegisterRequestModel({
    this.name,
    this.email,
    this.password,
    this.fcmToken,
  });

  factory RegisterRequestModel.fromJson(String str) => RegisterRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromMap(Map<String, dynamic> json) => RegisterRequestModel(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    fcmToken: json["fcm_token"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
    "password": password,
    "fcm_token": fcmToken,
  };
}
