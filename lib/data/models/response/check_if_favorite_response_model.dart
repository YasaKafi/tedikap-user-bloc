import 'dart:convert';

class PostFavoriteResponseModel {
  String? message;

  PostFavoriteResponseModel({
    this.message,
  });

  factory PostFavoriteResponseModel.fromJson(String str) => PostFavoriteResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostFavoriteResponseModel.fromMap(Map<String, dynamic> json) => PostFavoriteResponseModel(
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
  };
}
