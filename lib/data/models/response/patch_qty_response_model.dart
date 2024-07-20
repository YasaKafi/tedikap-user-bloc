import 'dart:convert';

class PatchQtyResponseModel {
  String? message;
  CartItem? cartItem;

  PatchQtyResponseModel({
    this.message,
    this.cartItem,
  });

  factory PatchQtyResponseModel.fromJson(String str) => PatchQtyResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PatchQtyResponseModel.fromMap(Map<String, dynamic> json) => PatchQtyResponseModel(
    message: json["message"],
    cartItem: json["cart_item"] == null ? null : CartItem.fromMap(json["cart_item"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
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
  int? price;
  int? totalPrice;

  CartItem({
    this.id,
    this.productId,
    this.temperatur,
    this.size,
    this.ice,
    this.sugar,
    this.note,
    this.quantity,
    this.price,
    this.totalPrice,
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
    price: json["price"],
    totalPrice: json["total_price"],
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
    "price": price,
    "total_price": totalPrice,
  };
}
