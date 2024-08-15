import 'dart:convert';

class HistoryOrderResponseModel {
  String? message;
  List<DataOrder>? orders;

  HistoryOrderResponseModel({
    this.message,
    this.orders,
  });

  factory HistoryOrderResponseModel.fromJson(String str) => HistoryOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoryOrderResponseModel.fromMap(Map<String, dynamic> json) => HistoryOrderResponseModel(
    message: json["message"],
    orders: json["orders"] == null ? [] : List<DataOrder>.from(json["orders"]!.map((x) => DataOrder.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "orders": orders == null ? [] : List<dynamic>.from(orders!.map((x) => x.toMap())),
  };
}

class DataOrder {
  String? id;
  int? userId;
  int? cartId;
  int? voucherId;
  int? totalPrice;
  int? discountAmount;
  int? rewardPoint;
  int? originalPrice;
  String? status;
  String? paymentChannel;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? schedulePickup;
  bool? cartItems;
  List<OrderItem>? orderItems;

  DataOrder({
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
    this.cartItems,
    this.orderItems,
  });

  factory DataOrder.fromJson(String str) => DataOrder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataOrder.fromMap(Map<String, dynamic> json) => DataOrder(
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
    cartItems: json["cart_length"],
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
    "cart_length": cartItems,
    "order_items": orderItems == null ? [] : List<dynamic>.from(orderItems!.map((x) => x.toMap())),
  };
}

class OrderItem {
  int? id;
  int? productId;
  String? productName;
  String? productImage;
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
    this.productImage,
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
    productImage: json["product_image"],
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
    "product_image": productImage,
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
