import 'dart:convert';

class UpdateFcmResponseModel {
  String? message;

  UpdateFcmResponseModel({
    this.message,
  });

  factory UpdateFcmResponseModel.fromJson(String str) => UpdateFcmResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateFcmResponseModel.fromMap(Map<String, dynamic> json) => UpdateFcmResponseModel(
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
  };
}
