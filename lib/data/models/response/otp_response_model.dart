import 'dart:convert';

class OtpResponseModel {
  String? message;

  OtpResponseModel({
    this.message,
  });

  factory OtpResponseModel.fromJson(String str) => OtpResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OtpResponseModel.fromMap(Map<String, dynamic> json) => OtpResponseModel(
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
  };
}
