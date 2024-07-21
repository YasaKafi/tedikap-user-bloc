import 'dart:convert';

class PostOrderRequestModel {
  int? voucherId;
  int? cartId;

  PostOrderRequestModel({
    this.voucherId,
    this.cartId,
  });

  factory PostOrderRequestModel.fromJson(String str) => PostOrderRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostOrderRequestModel.fromMap(Map<String, dynamic> json) => PostOrderRequestModel(
    voucherId: json["voucher_id"],
    cartId: json["cart_id"],
  );

  Map<String, dynamic> toMap() => {
    "voucher_id": voucherId,
    "cart_id": cartId,
  };
}
