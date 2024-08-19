import 'dart:convert';

class ProductsResponseModel {
  List<Datum>? data;

  ProductsResponseModel({
    this.data,
  });

  factory ProductsResponseModel.fromJson(String str) => ProductsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductsResponseModel.fromMap(Map<String, dynamic> json) => ProductsResponseModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datum {
  int? id;
  String? name;
  String? description;
  int? regularPrice;
  int? largePrice;
  String? category;
  String? image;
  bool? isLiked;
  int? favoritesCount;
  bool? stock;

  Datum({
    this.id,
    this.name,
    this.description,
    this.regularPrice,
    this.largePrice,
    this.category,
    this.image,
    this.isLiked,
    this.favoritesCount,
    this.stock,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    regularPrice: json["regular_price"],
    largePrice: json["large_price"],
    category: json["category"],
    image: json["image"],
    isLiked: json["isLiked"],
    favoritesCount: json["favorites_count"],
    stock: json["stock"],
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
    "stock": stock,
  };
}
