import 'dart:convert';

class RegisterRequestModel {
  String? name;
  String? email;
  String? password;
  String? otp;
  String? fcmToken;

  RegisterRequestModel({
    this.name,
    this.email,
    this.password,
    this.otp,
    this.fcmToken,
  });

  factory RegisterRequestModel.fromJson(String str) => RegisterRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromMap(Map<String, dynamic> json) => RegisterRequestModel(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    otp: json["otp"],
    fcmToken: json["fcm_token"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
    "password": password,
    "otp": otp,
    "fcm_token": fcmToken,
  };
}
