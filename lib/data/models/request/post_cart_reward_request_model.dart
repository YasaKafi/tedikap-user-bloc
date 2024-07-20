import 'dart:convert';

class PostCartRewardRequestModel {
  int? rewardProductId;
  String? temperatur;
  String? size;
  String? ice;
  String? sugar;
  String? note;
  int? quantity;
  int? points;

  PostCartRewardRequestModel({
    this.rewardProductId,
    this.temperatur,
    this.size,
    this.ice,
    this.sugar,
    this.note,
    this.quantity,
    this.points,
  });

  factory PostCartRewardRequestModel.fromJson(String str) => PostCartRewardRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostCartRewardRequestModel.fromMap(Map<String, dynamic> json) => PostCartRewardRequestModel(
    rewardProductId: json["reward_product_id"],
    temperatur: json["temperatur"],
    size: json["size"],
    ice: json["ice"],
    sugar: json["sugar"],
    note: json["note"],
    quantity: json["quantity"],
    points: json["points"],
  );

  Map<String, dynamic> toMap() => {
    "reward_product_id": rewardProductId,
    "temperatur": temperatur,
    "size": size,
    "ice": ice,
    "sugar": sugar,
    "note": note,
    "quantity": quantity,
    "points": points,
  };
}
