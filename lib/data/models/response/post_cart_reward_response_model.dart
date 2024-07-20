import 'dart:convert';

class PostCartRewardResponseModel {
  String? message;
  Cart? cart;

  PostCartRewardResponseModel({
    this.message,
    this.cart,
  });

  factory PostCartRewardResponseModel.fromJson(String str) => PostCartRewardResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostCartRewardResponseModel.fromMap(Map<String, dynamic> json) => PostCartRewardResponseModel(
    message: json["message"],
    cart: json["cart"] == null ? null : Cart.fromMap(json["cart"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "cart": cart?.toMap(),
  };
}

class Cart {
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

  Cart({
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

  factory Cart.fromJson(String str) => Cart.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cart.fromMap(Map<String, dynamic> json) => Cart(
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
