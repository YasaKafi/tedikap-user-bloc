import 'dart:convert';

class FavoriteResponseModel {
  List<DataFavorite>? data;

  FavoriteResponseModel({
    this.data,
  });

  factory FavoriteResponseModel.fromJson(String str) => FavoriteResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavoriteResponseModel.fromMap(Map<String, dynamic> json) => FavoriteResponseModel(
    data: json["data"] == null ? [] : List<DataFavorite>.from(json["data"]!.map((x) => DataFavorite.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class DataFavorite {
  int? id;
  int? productId;

  DataFavorite({
    this.id,
    this.productId,
  });

  factory DataFavorite.fromJson(String str) => DataFavorite.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataFavorite.fromMap(Map<String, dynamic> json) => DataFavorite(
    id: json["id"],
    productId: json["product_id"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "product_id": productId,
  };
}
