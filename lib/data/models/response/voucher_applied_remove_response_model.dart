import 'dart:convert';

class VoucherAppliedRemoveResponseModel {
  String? message;

  VoucherAppliedRemoveResponseModel({
    this.message,
  });

  factory VoucherAppliedRemoveResponseModel.fromJson(String str) => VoucherAppliedRemoveResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VoucherAppliedRemoveResponseModel.fromMap(Map<String, dynamic> json) => VoucherAppliedRemoveResponseModel(
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
  };
}
