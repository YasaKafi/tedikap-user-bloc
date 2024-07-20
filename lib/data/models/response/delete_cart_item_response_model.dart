import 'dart:convert';

class DeleteCartItemResponseModel {
  String? message;

  DeleteCartItemResponseModel({
    this.message,
  });

  factory DeleteCartItemResponseModel.fromJson(String str) => DeleteCartItemResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteCartItemResponseModel.fromMap(Map<String, dynamic> json) => DeleteCartItemResponseModel(
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
  };
}
