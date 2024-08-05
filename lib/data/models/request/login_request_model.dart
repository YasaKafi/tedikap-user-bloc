import 'dart:convert';

class LoginRequestModel {
  String? email;
  String? password;
  String? fcmToken;

  LoginRequestModel({
    this.email,
    this.password,
    this.fcmToken,
  });

  factory LoginRequestModel.fromJson(String str) => LoginRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromMap(Map<String, dynamic> json) => LoginRequestModel(
    email: json["email"],
    password: json["password"],
    fcmToken: json["fcm_token"],
  );

  Map<String, dynamic> toMap() => {
    "email": email,
    "password": password,
    "fcm_token": fcmToken,
  };
}
