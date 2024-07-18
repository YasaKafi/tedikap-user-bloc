import 'dart:convert';

class ProductsRewardResponseModel {
  List<DataRewardProduct>? data;

  ProductsRewardResponseModel({
    this.data,
  });

  factory ProductsRewardResponseModel.fromJson(String str) => ProductsRewardResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductsRewardResponseModel.fromMap(Map<String, dynamic> json) => ProductsRewardResponseModel(
    data: json["data"] == null ? [] : List<DataRewardProduct>.from(json["data"]!.map((x) => DataRewardProduct.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class DataRewardProduct {
  int? id;
  String? name;
  String? description;
  int? regularPoint;
  int? largePoint;
  String? category;
  String? image;

  DataRewardProduct({
    this.id,
    this.name,
    this.description,
    this.regularPoint,
    this.largePoint,
    this.category,
    this.image,
  });

  factory DataRewardProduct.fromJson(String str) => DataRewardProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataRewardProduct.fromMap(Map<String, dynamic> json) => DataRewardProduct(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    regularPoint: json["regular_point"],
    largePoint: json["large_point"],
    category: json["category"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "regular_point": regularPoint,
    "large_point": largePoint,
    "category": category,
    "image": image,
  };
}
