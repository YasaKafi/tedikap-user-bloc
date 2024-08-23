import 'dart:convert';

class CartResponseModel {
  Cart? cart;

  CartResponseModel({
    this.cart,
  });

  factory CartResponseModel.fromJson(String str) => CartResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CartResponseModel.fromMap(Map<String, dynamic> json) => CartResponseModel(
    cart: json["cart"] == null ? null : Cart.fromMap(json["cart"]),
  );

  Map<String, dynamic> toMap() => {
    "cart": cart?.toMap(),
  };
}

class Cart {
  int? id;
  int? userId;
  int? voucherId;
  int? totalPrice;
  int? discountAmount;
  int? originalPrice;
  int? rewardPoint;
  String? schedulePickup;
  String? session1;
  String? session2;
  bool? isPhone;
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
    this.session1,
    this.session2,
    this.isPhone,
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
    session1: json["session_1"],
    session2: json["session_2"],
    isPhone: json["is_phone"],
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
    "session_1": session1,
    "session_2": session2,
    "is_phone": isPhone,
    "cart_items": cartItems == null ? [] : List<dynamic>.from(cartItems!.map((x) => x.toMap())),
  };
}

class CartItem {
  int? id;
  int? productId;
  String? productName;
  String? productImage;
  bool? stock;
  String? temperatur;
  String? size;
  String? ice;
  String? sugar;
  dynamic note;
  int? quantity;
  int? price;
  int? totalPrice;

  CartItem({
    this.id,
    this.productId,
    this.productName,
    this.productImage,
    this.stock,
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
    stock: json["stock"],
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
    "stock": stock,
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
