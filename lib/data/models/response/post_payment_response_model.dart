import 'dart:convert';

class PostPaymentResponseModel {
  dynamic paymentChannel;
  String? status;
  String? checkoutLink;
  String? externalId;
  int? userId;
  int? amount;
  String? orderId;
  DateTime? expiresAt;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  PostPaymentResponseModel({
    this.paymentChannel,
    this.status,
    this.checkoutLink,
    this.externalId,
    this.userId,
    this.amount,
    this.orderId,
    this.expiresAt,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory PostPaymentResponseModel.fromJson(String str) => PostPaymentResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostPaymentResponseModel.fromMap(Map<String, dynamic> json) => PostPaymentResponseModel(
    paymentChannel: json["payment_channel"],
    status: json["status"],
    checkoutLink: json["checkout_link"],
    externalId: json["external_id"],
    userId: json["user_id"],
    amount: json["amount"],
    orderId: json["order_id"],
    expiresAt: json["expires_at"] == null ? null : DateTime.parse(json["expires_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "payment_channel": paymentChannel,
    "status": status,
    "checkout_link": checkoutLink,
    "external_id": externalId,
    "user_id": userId,
    "amount": amount,
    "order_id": orderId,
    "expires_at": expiresAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
