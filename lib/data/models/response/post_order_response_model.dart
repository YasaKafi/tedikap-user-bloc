import 'dart:convert';

class PostOrderResponseModel {
  String? message;
  Order? order;

  PostOrderResponseModel({
    this.message,
    this.order,
  });

  factory PostOrderResponseModel.fromJson(String str) => PostOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostOrderResponseModel.fromMap(Map<String, dynamic> json) => PostOrderResponseModel(
    message: json["message"],
    order: json["order"] == null ? null : Order.fromMap(json["order"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "order": order?.toMap(),
  };
}

class Order {
  String? id;
  int? userId;
  int? cartId;
  dynamic voucherId;
  int? totalPrice;
  int? discountAmount;
  int? rewardPoint;
  int? originalPrice;
  String? status;
  dynamic paymentChannel;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? schedulePickup;
  List<OrderItem>? orderItems;

  Order({
    this.id,
    this.userId,
    this.cartId,
    this.voucherId,
    this.totalPrice,
    this.discountAmount,
    this.rewardPoint,
    this.originalPrice,
    this.status,
    this.paymentChannel,
    this.createdAt,
    this.updatedAt,
    this.schedulePickup,
    this.orderItems,
  });

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
    id: json["id"],
    userId: json["user_id"],
    cartId: json["cart_id"],
    voucherId: json["voucher_id"],
    totalPrice: json["total_price"],
    discountAmount: json["discount_amount"],
    rewardPoint: json["reward_point"],
    originalPrice: json["original_price"],
    status: json["status"],
    paymentChannel: json["payment_channel"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    schedulePickup: json["schedule_pickup"],
    orderItems: json["order_items"] == null ? [] : List<OrderItem>.from(json["order_items"]!.map((x) => OrderItem.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "cart_id": cartId,
    "voucher_id": voucherId,
    "total_price": totalPrice,
    "discount_amount": discountAmount,
    "reward_point": rewardPoint,
    "original_price": originalPrice,
    "status": status,
    "payment_channel": paymentChannel,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "schedule_pickup": schedulePickup,
    "order_items": orderItems == null ? [] : List<dynamic>.from(orderItems!.map((x) => x.toMap())),
  };
}

class OrderItem {
  int? id;
  int? productId;
  String? productName;
  String? itemType;
  String? temperatur;
  String? size;
  String? ice;
  String? sugar;
  String? note;
  int? quantity;
  int? price;

  OrderItem({
    this.id,
    this.productId,
    this.productName,
    this.itemType,
    this.temperatur,
    this.size,
    this.ice,
    this.sugar,
    this.note,
    this.quantity,
    this.price,
  });

  factory OrderItem.fromJson(String str) => OrderItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItem.fromMap(Map<String, dynamic> json) => OrderItem(
    id: json["id"],
    productId: json["product_id"],
    productName: json["product_name"],
    itemType: json["item_type"],
    temperatur: json["temperatur"],
    size: json["size"],
    ice: json["ice"],
    sugar: json["sugar"],
    note: json["note"],
    quantity: json["quantity"],
    price: json["price"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_id": productId,
    "product_name": productName,
    "item_type": itemType,
    "temperatur": temperatur,
    "size": size,
    "ice": ice,
    "sugar": sugar,
    "note": note,
    "quantity": quantity,
    "price": price,
  };
}
