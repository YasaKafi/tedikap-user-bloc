import 'dart:convert';

class ResetPasswordRequestModel {
  String? email;
  String? otp;
  String? password;
  String? token;
  String? passwordConfirmation;

  ResetPasswordRequestModel({
    this.email,
    this.otp,
    this.password,
    this.token,
    this.passwordConfirmation,
  });

  factory ResetPasswordRequestModel.fromJson(String str) => ResetPasswordRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResetPasswordRequestModel.fromMap(Map<String, dynamic> json) => ResetPasswordRequestModel(
    email: json["email"],
    otp: json["otp"],
    password: json["password"],
    token: json["token"],
    passwordConfirmation: json["password_confirmation"],
  );

  Map<String, dynamic> toMap() => {
    "email": email,
    "otp": otp,
    "password": password,
    "token": token,
    "password_confirmation": passwordConfirmation,
  };
}
