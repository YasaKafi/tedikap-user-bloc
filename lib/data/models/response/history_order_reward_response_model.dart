import 'dart:convert';

class HistoryOrderRewardResponseModel {
  String? message;
  List<DataOrderReward>? orders;

  HistoryOrderRewardResponseModel({
    this.message,
    this.orders,
  });

  factory HistoryOrderRewardResponseModel.fromJson(String str) => HistoryOrderRewardResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoryOrderRewardResponseModel.fromMap(Map<String, dynamic> json) => HistoryOrderRewardResponseModel(
    message: json["message"],
    orders: json["orders"] == null ? [] : List<DataOrderReward>.from(json["orders"]!.map((x) => DataOrderReward.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "orders": orders == null ? [] : List<dynamic>.from(orders!.map((x) => x.toMap())),
  };
}

class DataOrderReward {
  String? id;
  int? userId;
  int? cartRewardId;
  int? totalPoint;
  String? status;
  String? schedulePickup;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<OrderRewardItem>? orderRewardItems;

  DataOrderReward({
    this.id,
    this.userId,
    this.cartRewardId,
    this.totalPoint,
    this.status,
    this.schedulePickup,
    this.createdAt,
    this.updatedAt,
    this.orderRewardItems,
  });

  factory DataOrderReward.fromJson(String str) => DataOrderReward.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataOrderReward.fromMap(Map<String, dynamic> json) => DataOrderReward(
    id: json["id"],
    userId: json["user_id"],
    cartRewardId: json["cart_reward_id"],
    totalPoint: json["total_point"],
    status: json["status"],
    schedulePickup: json["schedule_pickup"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    orderRewardItems: json["order_reward_items"] == null ? [] : List<OrderRewardItem>.from(json["order_reward_items"]!.map((x) => OrderRewardItem.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "cart_reward_id": cartRewardId,
    "total_point": totalPoint,
    "status": status,
    "schedule_pickup": schedulePickup,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "order_reward_items": orderRewardItems == null ? [] : List<dynamic>.from(orderRewardItems!.map((x) => x.toMap())),
  };
}

class OrderRewardItem {
  int? id;
  int? productId;
  String? productName;
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
