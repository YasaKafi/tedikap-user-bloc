import 'dart:convert';

class HistoryOrderResponseModel {
  String? message;
  List<Order>? orders;

  HistoryOrderResponseModel({
    this.message,
    this.orders,
  });

  factory HistoryOrderResponseModel.fromJson(String str) => HistoryOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoryOrderResponseModel.fromMap(Map<String, dynamic> json) => HistoryOrderResponseModel(
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
  int? cartId;
  String? name;
  String? avatar;
  dynamic voucherId;
  int? totalPrice;
  int? discountAmount;
  int? rewardPoint;
  int? originalPrice;
  String? status;
  String? statusDescription;
  String? whatsapp;
  String? whatsappUser;
  String? orderType;
  String? schedulePickup;
  String? iconStatus;
  String? paymentChannel;
  bool? cartLength;
  double? rating;
  String? linkInvoice;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? expiresAt;
  List<OrderItem>? orderItems;

  Order({
    this.id,
    this.userId,
    this.cartId,
    this.name,
    this.avatar,
    this.voucherId,
    this.totalPrice,
    this.discountAmount,
    this.rewardPoint,
    this.originalPrice,
    this.status,
    this.statusDescription,
    this.whatsapp,
    this.whatsappUser,
    this.orderType,
    this.schedulePickup,
    this.iconStatus,
    this.paymentChannel,
    this.cartLength,
    this.rating,
    this.linkInvoice,
    this.createdAt,
    this.updatedAt,
    this.expiresAt,
    this.orderItems,
  });

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
    id: json["id"],
    userId: json["user_id"],
    cartId: json["cart_id"],
    name: json["name"],
    avatar: json["avatar"],
    voucherId: json["voucher_id"],
    totalPrice: json["total_price"],
    discountAmount: json["discount_amount"],
    rewardPoint: json["reward_point"],
    originalPrice: json["original_price"],
    status: json["status"],
    statusDescription: json["status_description"],
    whatsapp: json["whatsapp"],
    whatsappUser: json["whatsapp_user"],
    orderType: json["order_type"],
    schedulePickup: json["schedule_pickup"],
    iconStatus: json["icon_status"],
    paymentChannel: json["payment_channel"],
    cartLength: json["cart_length"],
    rating: json["rating"],
    linkInvoice: json["link_invoice"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    expiresAt: json["expires_at"] == null ? null : DateTime.parse(json["expires_at"]),
    orderItems: json["order_items"] == null ? [] : List<OrderItem>.from(json["order_items"]!.map((x) => OrderItem.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "cart_id": cartId,
    "name": name,
    "avatar": avatar,
    "voucher_id": voucherId,
    "total_price": totalPrice,
    "discount_amount": discountAmount,
    "reward_point": rewardPoint,
    "original_price": originalPrice,
    "status": status,
    "status_description": statusDescription,
    "whatsapp": whatsapp,
    "whatsapp_user": whatsappUser,
    "order_type": orderType,
    "schedule_pickup": schedulePickup,
    "icon_status": iconStatus,
    "payment_channel": paymentChannel,
    "cart_length": cartLength,
    "rating": rating,
    "link_invoice": linkInvoice,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "expires_at": expiresAt?.toIso8601String(),
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
  dynamic note;
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
