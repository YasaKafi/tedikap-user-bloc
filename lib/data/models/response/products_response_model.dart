import 'dart:convert';

class ProductsResponseModel {
  List<DataProduct>? data;

  ProductsResponseModel({
    this.data,
  });

  factory ProductsResponseModel.fromJson(String str) => ProductsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductsResponseModel.fromMap(Map<String, dynamic> json) => ProductsResponseModel(
    data: json["data"] == null ? [] : List<DataProduct>.from(json["data"]!.map((x) => DataProduct.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class DataProduct {
  int? id;
  String? name;
  String? description;
  int? regularPrice;
  int? largePrice;
  String? category;
  String? image;

  DataProduct({
    this.id,
    this.name,
    this.description,
    this.regularPrice,
    this.largePrice,
    this.category,
    this.image,
  });

  factory DataProduct.fromJson(String str) => DataProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataProduct.fromMap(Map<String, dynamic> json) => DataProduct(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    regularPrice: json["regular_price"],
    largePrice: json["large_price"],
    category: json["category"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "regular_price": regularPrice,
    "large_price": largePrice,
    "category": category,
    "image": image,
  };
}
