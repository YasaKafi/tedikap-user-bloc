import 'dart:convert';


class PostFavoriteResponseModel {
  String? message;
  String? status;
  Product? product;

  PostFavoriteResponseModel({
    this.message,
    this.status,
    this.product,
  });

  factory PostFavoriteResponseModel.fromJson(String str) => PostFavoriteResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostFavoriteResponseModel.fromMap(Map<String, dynamic> json) => PostFavoriteResponseModel(
    message: json["message"],
    status: json["status"],
    product: json["product"] == null ? null : Product.fromMap(json["product"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "status": status,
    "product": product?.toMap(),
  };
}

class Product {
  int? id;
  String? name;
  String? description;
  int? regularPrice;
  int? largePrice;
  String? category;
  String? image;
  bool? isLiked;
  dynamic favoritesCount;

  Product({
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

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
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

