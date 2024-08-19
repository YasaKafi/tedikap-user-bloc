import 'dart:convert';

class PostReviewResponseModel {
  String? message;
  Data? data;

  PostReviewResponseModel({
    this.message,
    this.data,
  });

  factory PostReviewResponseModel.fromJson(String str) => PostReviewResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostReviewResponseModel.fromMap(Map<String, dynamic> json) => PostReviewResponseModel(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "data": data?.toMap(),
  };
}

class Data {
  int? id;
  int? userId;
  String? orderId;
  String? name;
  String? avatar;
  double staffService;
  double productQuality;
  String? note;

  Data({
    this.id,
    this.userId,
    this.orderId,
    this.name,
    this.avatar,
    required this.staffService,
    required this.productQuality,
    this.note,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"] as int?,
    userId: json["user_id"] as int?,
    orderId: json["order_id"] as String?,
    name: json["name"] as String?,
    avatar: json["avatar"] as String?,
    staffService: (json["staff_service"] as num).toDouble(),  // Convert int to double if necessary
    productQuality: (json["product_quality"] as num).toDouble(),  // Convert int to double if necessary
    note: json["note"] as String?,
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "order_id": orderId,
    "name": name,
    "avatar": avatar,
    "staff_service": staffService,
    "product_quality": productQuality,
    "note": note,
  };
}
