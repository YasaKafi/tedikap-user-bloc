import 'dart:convert';

class PostPaymentRequestModel {
  String? orderId;

  PostPaymentRequestModel({
    this.orderId,
  });

  factory PostPaymentRequestModel.fromJson(String str) => PostPaymentRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostPaymentRequestModel.fromMap(Map<String, dynamic> json) => PostPaymentRequestModel(
    orderId: json["order_id"],
  );

  Map<String, dynamic> toMap() => {
    "order_id": orderId,
  };
}
