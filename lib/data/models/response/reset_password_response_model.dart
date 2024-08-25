import 'dart:convert';

class ResetPasswordResponseModel {
  String? message;

  ResetPasswordResponseModel({
    this.message,
  });

  factory ResetPasswordResponseModel.fromJson(String str) => ResetPasswordResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResetPasswordResponseModel.fromMap(Map<String, dynamic> json) => ResetPasswordResponseModel(
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
  };
}
