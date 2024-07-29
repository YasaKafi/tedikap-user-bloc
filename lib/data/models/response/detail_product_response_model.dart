import 'dart:convert';

class DetailProductResponseModel {
  DetailDataProduct? data;

  DetailProductResponseModel({
    this.data,
  });

  factory DetailProductResponseModel.fromJson(String str) => DetailProductResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailProductResponseModel.fromMap(Map<String, dynamic> json) => DetailProductResponseModel(
    data: json["data"] == null ? null : DetailDataProduct.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "data": data?.toMap(),
  };
}

class DetailDataProduct {
  int? id;
  String? name;
  String? description;
  int? regularPrice;
  int? largePrice;
  String? category;
  String? image;
  bool? isLiked;
  dynamic favoritesCount;

  DetailDataProduct({
    this.id,
    this.name,
    this.description,
    this.regularPrice,
    this.largePrice,
    this.category,
    this.image,
    this.isLiked,
    this.favoritesCount,
  });

  factory DetailDataProduct.fromJson(String str) => DetailDataProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailDataProduct.fromMap(Map<String, dynamic> json) => DetailDataProduct(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    regularPrice: json["regular_price"],
    largePrice: json["large_price"],
    category: json["category"],
    image: json["image"],
    isLiked: json["isLiked"],
    favoritesCount: json["favorites_count"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "regular_price": regularPrice,
    "large_price": largePrice,
    "category": category,
    "image": image,
    "isLiked": isLiked,
    "favorites_count": favoritesCount,
  };
}
