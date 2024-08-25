import 'dart:convert';

class VerifyOtpResponseModel {
  String? message;
  String? resetToken;

  VerifyOtpResponseModel({
    this.message,
    this.resetToken,
  });

  factory VerifyOtpResponseModel.fromJson(String str) => VerifyOtpResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VerifyOtpResponseModel.fromMap(Map<String, dynamic> json) => VerifyOtpResponseModel(
    message: json["message"],
    resetToken: json["reset_token"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "reset_token": resetToken,
  };
}
