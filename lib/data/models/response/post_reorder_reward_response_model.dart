import 'dart:convert';

class PostReOrderRewardResponseModel {
  String? message;
  Cart? cart;

  PostReOrderRewardResponseModel({
    this.message,
    this.cart,
  });

  factory PostReOrderRewardResponseModel.fromJson(String str) => PostReOrderRewardResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostReOrderRewardResponseModel.fromMap(Map<String, dynamic> json) => PostReOrderRewardResponseModel(
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
  int? userId;
  dynamic totalPoints;
  String? schedulePickup;
  List<CartItem>? cartItems;

  Cart({
    this.id,
    this.userId,
    this.totalPoints,
    this.schedulePickup,
    this.cartItems,
  });

  factory Cart.fromJson(String str) => Cart.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cart.fromMap(Map<String, dynamic> json) => Cart(
    id: json["id"],
    userId: json["user_id"],
    totalPoints: json["total_points"],
    schedulePickup: json["schedule_pickup"],
    cartItems: json["cart_items"] == null ? [] : List<CartItem>.from(json["cart_items"]!.map((x) => CartItem.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "total_points": totalPoints,
    "schedule_pickup": schedulePickup,
    "cart_items": cartItems == null ? [] : List<dynamic>.from(cartItems!.map((x) => x.toMap())),
  };
}

class CartItem {
  int? id;
  int? productId;
  String? productName;
  String? productImage;
  String? temperatur;
  String? size;
  String? ice;
  String? sugar;
  dynamic note;
  int? quantity;
  int? points;
  int? totalPoints;

  CartItem({
    this.id,
    this.productId,
    this.productName,
    this.productImage,
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
    productName: json["product_name"],
    productImage: json["product_image"],
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
    "product_name": productName,
    "product_image": productImage,
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
