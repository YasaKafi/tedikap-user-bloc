import 'dart:convert';

class FavoriteResponseModel {
  List<ItemFavorite>? data;

  FavoriteResponseModel({
    this.data,
  });

  factory FavoriteResponseModel.fromJson(String str) => FavoriteResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FavoriteResponseModel.fromMap(Map<String, dynamic> json) => FavoriteResponseModel(
    data: json["data"] == null ? [] : List<ItemFavorite>.from(json["data"]!.map((x) => ItemFavorite.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class ItemFavorite {
  int? id;
  Product? product;

  ItemFavorite({
    this.id,
    this.product,
  });

  factory ItemFavorite.fromJson(String str) => ItemFavorite.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemFavorite.fromMap(Map<String, dynamic> json) => ItemFavorite(
    id: json["id"],
    product: json["product"] == null ? null : Product.fromMap(json["product"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
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
