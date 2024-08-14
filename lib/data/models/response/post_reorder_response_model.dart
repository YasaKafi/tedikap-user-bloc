import 'dart:convert';

class PostReOrderResponseModel {
  String? message;
  Cart? cart;

  PostReOrderResponseModel({
    this.message,
    this.cart,
  });

  factory PostReOrderResponseModel.fromJson(String str) => PostReOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostReOrderResponseModel.fromMap(Map<String, dynamic> json) => PostReOrderResponseModel(
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
  dynamic voucherId;
  dynamic totalPrice;
  dynamic discountAmount;
  dynamic originalPrice;
  int? rewardPoint;
  String? schedulePickup;
  List<CartItem>? cartItems;

  Cart({
    this.id,
    this.userId,
    this.voucherId,
    this.totalPrice,
    this.discountAmount,
    this.originalPrice,
    this.rewardPoint,
    this.schedulePickup,
    this.cartItems,
  });

  factory Cart.fromJson(String str) => Cart.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cart.fromMap(Map<String, dynamic> json) => Cart(
    id: json["id"],
    userId: json["user_id"],
    voucherId: json["voucher_id"],
    totalPrice: json["total_price"],
    discountAmount: json["discount_amount"],
    originalPrice: json["original_price"],
    rewardPoint: json["reward_point"],
    schedulePickup: json["schedule_pickup"],
    cartItems: json["cart_items"] == null ? [] : List<CartItem>.from(json["cart_items"]!.map((x) => CartItem.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "voucher_id": voucherId,
    "total_price": totalPrice,
    "discount_amount": discountAmount,
    "original_price": originalPrice,
    "reward_point": rewardPoint,
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
  String? note;
  int? quantity;
  int? price;
  int? totalPrice;

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
    this.price,
    this.totalPrice,
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
    price: json["price"],
    totalPrice: json["total_price"],
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
    "price": price,
    "total_price": totalPrice,
  };
}
