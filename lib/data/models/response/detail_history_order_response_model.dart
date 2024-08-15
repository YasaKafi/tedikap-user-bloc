import 'dart:convert';

class DetailHistoryOrderResponseModel {
  String? message;
  DetailOrder? order;

  DetailHistoryOrderResponseModel({
    this.message,
    this.order,
  });

  factory DetailHistoryOrderResponseModel.fromJson(String str) => DetailHistoryOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailHistoryOrderResponseModel.fromMap(Map<String, dynamic> json) => DetailHistoryOrderResponseModel(
    message: json["message"],
    order: json["order"] == null ? null : DetailOrder.fromMap(json["order"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "order": order?.toMap(),
  };
}

class DetailOrder {
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
  String? iconStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? schedulePickup;
  bool? cartItems;
  List<DetailOrderItem>? orderItems;

  DetailOrder({
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
    this.iconStatus,
    this.createdAt,
    this.updatedAt,
    this.schedulePickup,
    this.orderItems,
  });

  factory DetailOrder.fromJson(String str) => DetailOrder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailOrder.fromMap(Map<String, dynamic> json) => DetailOrder(
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
    iconStatus: json["icon_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    schedulePickup: json["schedule_pickup"],
    orderItems: json["order_items"] == null ? [] : List<DetailOrderItem>.from(json["order_items"]!.map((x) => DetailOrderItem.fromMap(x))),
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
    "icon_status": iconStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "schedule_pickup": schedulePickup,
    "order_items": orderItems == null ? [] : List<dynamic>.from(orderItems!.map((x) => x.toMap())),
  };
}

class DetailOrderItem {
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

  DetailOrderItem({
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

  factory DetailOrderItem.fromJson(String str) => DetailOrderItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailOrderItem.fromMap(Map<String, dynamic> json) => DetailOrderItem(
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
