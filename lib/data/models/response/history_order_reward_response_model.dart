import 'dart:convert';

class HistoryOrderRewardResponseModel {
  String? message;
  List<Order>? orders;

  HistoryOrderRewardResponseModel({
    this.message,
    this.orders,
  });

  factory HistoryOrderRewardResponseModel.fromJson(String str) => HistoryOrderRewardResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoryOrderRewardResponseModel.fromMap(Map<String, dynamic> json) => HistoryOrderRewardResponseModel(
    message: json["message"],
    orders: json["orders"] == null ? [] : List<Order>.from(json["orders"]!.map((x) => Order.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "orders": orders == null ? [] : List<dynamic>.from(orders!.map((x) => x.toMap())),
  };
}

class Order {
  String? id;
  int? userId;
  String? name;
  String? avatar;
  int? cartRewardId;
  int? totalPoint;
  String? status;
  String? statusDescription;
  String? whatsapp;
  String? iconStatus;
  String? orderType;
  String? schedulePickup;
  bool? cartLength;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? expiresAt;
  List<OrderRewardItem>? orderRewardItems;

  Order({
    this.id,
    this.userId,
    this.name,
    this.avatar,
    this.cartRewardId,
    this.totalPoint,
    this.status,
    this.statusDescription,
    this.whatsapp,
    this.iconStatus,
    this.orderType,
    this.schedulePickup,
    this.cartLength,
    this.createdAt,
    this.updatedAt,
    this.expiresAt,
    this.orderRewardItems,
  });

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    avatar: json["avatar"],
    cartRewardId: json["cart_reward_id"],
    totalPoint: json["total_point"],
    status: json["status"],
    statusDescription: json["status_description"],
    whatsapp: json["whatsapp"],
    iconStatus: json["icon_status"],
    orderType: json["order_type"],
    schedulePickup: json["schedule_pickup"],
    cartLength: json["cart_length"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    expiresAt: json["expires_at"] == null ? null : DateTime.parse(json["expires_at"]),
    orderRewardItems: json["order_reward_items"] == null ? [] : List<OrderRewardItem>.from(json["order_reward_items"]!.map((x) => OrderRewardItem.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "avatar": avatar,
    "cart_reward_id": cartRewardId,
    "total_point": totalPoint,
    "status": status,
    "status_description": statusDescription,
    "whatsapp": whatsapp,
    "icon_status": iconStatus,
    "order_type": orderType,
    "schedule_pickup": schedulePickup,
    "cart_length": cartLength,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "expires_at": expiresAt?.toIso8601String(),
    "order_reward_items": orderRewardItems == null ? [] : List<dynamic>.from(orderRewardItems!.map((x) => x.toMap())),
  };
}

class OrderRewardItem {
  int? id;
  int? productId;
  String? productName;
  String? productImage;
  String? itemType;
  String? temperatur;
  String? size;
  String? ice;
  String? sugar;
  dynamic note;
  int? quantity;
  int? points;
  int? totalPoints;

  OrderRewardItem({
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
    this.points,
    this.totalPoints,
  });

  factory OrderRewardItem.fromJson(String str) => OrderRewardItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderRewardItem.fromMap(Map<String, dynamic> json) => OrderRewardItem(
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
    points: json["points"],
    totalPoints: json["total_points"],
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
    "points": points,
    "total_points": totalPoints,
  };
}
