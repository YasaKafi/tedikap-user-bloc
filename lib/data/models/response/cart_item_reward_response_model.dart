import 'dart:convert';

class CartItemRewardResponseModel {
  CartItem? cartItem;

  CartItemRewardResponseModel({
    this.cartItem,
  });

  factory CartItemRewardResponseModel.fromJson(String str) => CartItemRewardResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartItemRewardResponseModel.fromMap(Map<String, dynamic> json) => CartItemRewardResponseModel(
    cartItem: json["cart_item"] == null ? null : CartItem.fromMap(json["cart_item"]),
  );

  Map<String, dynamic> toMap() => {
    "cart_item": cartItem?.toMap(),
  };
}

class CartItem {
  int? id;
  int? productId;
  String? temperatur;
  String? size;
  String? ice;
  String? sugar;
  String? note;
  int? quantity;
  int? points;
  int? totalPoints;

  CartItem({
    this.id,
    this.productId,
    this.temperatur,
    this.size,
    this.ice,
    this.sugar,
    this.note,
    this.quantity,
    this.points,
    this.totalPoints,
  });

  factory CartItem.fromJson(String str) => CartItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartItem.fromMap(Map<String, dynamic> json) => CartItem(
    id: json["id"],
    productId: json["product_id"],
    temperatur: json["temperatur"],
    size: json["size"],
    ice: json["ice"],
    sugar: json["sugar"],
    note: json["note"],
    quantity: json["quantity"],
    points: json["points"],
    totalPoints: json["total_points"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_id": productId,
    "temperatur": temperatur,
    "size": size,
    "ice": ice,
    "sugar": sugar,
    "note": note,
    "quantity": quantity,
    "points": points,
    "total_points": totalPoints,
  };
}
