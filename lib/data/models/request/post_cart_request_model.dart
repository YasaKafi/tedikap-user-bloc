import 'dart:convert';

class PostCartRequestModel {
  int? productId;
  String? temperatur;
  String? size;
  String? ice;
  String? sugar;
  String? note;
  int? quantity;

  PostCartRequestModel({
    this.productId,
    this.temperatur,
    this.size,
    this.ice,
    this.sugar,
    this.note,
    this.quantity,
  });

  factory PostCartRequestModel.fromJson(String str) => PostCartRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostCartRequestModel.fromMap(Map<String, dynamic> json) => PostCartRequestModel(
    productId: json["product_id"],
    temperatur: json["temperatur"],
    size: json["size"],
    ice: json["ice"],
    sugar: json["sugar"],
    note: json["note"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toMap() => {
    "product_id": productId,
    "temperatur": temperatur,
    "size": size,
    "ice": ice,
    "sugar": sugar,
    "note": note,
    "quantity": quantity,
  };
}
