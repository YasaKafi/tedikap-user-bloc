import 'dart:convert';

class DetailProductRewardResponseModel {
  String? status;
  String? message;
  DetailDataProductReward? data;

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
    data: json["data"] == null ? null : DetailDataProductReward.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "data": data?.toMap(),
  };
}

class DetailDataProductReward {
  int? id;
  String? name;
  String? description;
  String? image;
  int? regularPoint;
  int? largePoint;
  String? category;
  DateTime? createdAt;
  DateTime? updatedAt;

  DetailDataProductReward({
    this.id,
    this.name,
    this.description,
    this.image,
    this.regularPoint,
    this.largePoint,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  factory DetailDataProductReward.fromJson(String str) => DetailDataProductReward.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailDataProductReward.fromMap(Map<String, dynamic> json) => DetailDataProductReward(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    regularPoint: json["regular_point"],
    largePoint: json["large_point"],
    category: json["category"],
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
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
