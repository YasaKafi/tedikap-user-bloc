import 'dart:convert';

class DetailProductRewardResponseModel {
  String? status;
  String? message;
  Data? data;

  DetailProductRewardResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory DetailProductRewardResponseModel.fromJson(String str) => DetailProductRewardResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailProductRewardResponseModel.fromMap(Map<String, dynamic> json) => DetailProductRewardResponseModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data?.toMap(),
  };
}

class Data {
  int? id;
  String? name;
  String? description;
  String? image;
  int? regularPoint;
  int? largePoint;
  String? category;
  bool? stock;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.name,
    this.description,
    this.image,
    this.regularPoint,
    this.largePoint,
    this.category,
    this.stock,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    regularPoint: json["regular_point"],
    largePoint: json["large_point"],
    category: json["category"],
    stock: json["stock"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "regular_point": regularPoint,
    "large_point": largePoint,
    "category": category,
    "stock": stock,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
