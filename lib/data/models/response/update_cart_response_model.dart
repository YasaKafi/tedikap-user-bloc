import 'dart:convert';

class UpdateCartResponseModel {
  String? message;
  Cart? cart;

  UpdateCartResponseModel({
    this.message,
    this.cart,
  });

  factory UpdateCartResponseModel.fromJson(String str) => UpdateCartResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdateCartResponseModel.fromMap(Map<String, dynamic> json) => UpdateCartResponseModel(
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
  int? price;
  int? totalPrice;

  Cart({
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
