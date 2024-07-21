import 'dart:convert';

class PostOrderRewardRequestModel {
  int? cartRewardId;

  PostOrderRewardRequestModel({
    this.cartRewardId,
  });

  factory PostOrderRewardRequestModel.fromJson(String str) => PostOrderRewardRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostOrderRewardRequestModel.fromMap(Map<String, dynamic> json) => PostOrderRewardRequestModel(
    cartRewardId: json["cart_reward_id"],
  );

  Map<String, dynamic> toMap() => {
    "cart_reward_id": cartRewardId,
  };
}
