import 'dart:convert';

class DetailHistoryOrderRewardResponseModel {
  String? message;
  DetailOrderReward? order;

  DetailHistoryOrderRewardResponseModel({
    this.message,
    this.order,
  });

  factory DetailHistoryOrderRewardResponseModel.fromJson(String str) => DetailHistoryOrderRewardResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailHistoryOrderRewardResponseModel.fromMap(Map<String, dynamic> json) => DetailHistoryOrderRewardResponseModel(
    message: json["message"],
    order: json["order"] == null ? null : DetailOrderReward.fromMap(json["order"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "order": order?.toMap(),
  };
}

class DetailOrderReward {
  String? id;
  int? userId;
  int? cartRewardId;
  int? totalPoint;
  String? status;
  String? schedulePickup;
  String? iconStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<DetailOrderRewardItem>? orderRewardItems;

  DetailOrderReward({
    this.id,
    this.userId,
    this.cartRewardId,
    this.totalPoint,
    this.status,
    this.schedulePickup,
    this.iconStatus,
    this.createdAt,
    this.updatedAt,
    this.orderRewardItems,
  });

  factory DetailOrderReward.fromJson(String str) => DetailOrderReward.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailOrderReward.fromMap(Map<String, dynamic> json) => DetailOrderReward(
    id: json["id"],
    userId: json["user_id"],
    cartRewardId: json["cart_reward_id"],
    totalPoint: json["total_point"],
    status: json["status"],
    schedulePickup: json["schedule_pickup"],
    iconStatus: json["icon_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    orderRewardItems: json["order_reward_items"] == null ? [] : List<DetailOrderRewardItem>.from(json["order_reward_items"]!.map((x) => DetailOrderRewardItem.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "cart_reward_id": cartRewardId,
    "total_point": totalPoint,
    "status": status,
    "schedule_pickup": schedulePickup,
    "icon_status": iconStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "order_reward_items": orderRewardItems == null ? [] : List<dynamic>.from(orderRewardItems!.map((x) => x.toMap())),
  };
}

class DetailOrderRewardItem {
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
  int? points;
  int? totalPoints;

  DetailOrderRewardItem({
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

  factory DetailOrderRewardItem.fromJson(String str) => DetailOrderRewardItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailOrderRewardItem.fromMap(Map<String, dynamic> json) => DetailOrderRewardItem(
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
