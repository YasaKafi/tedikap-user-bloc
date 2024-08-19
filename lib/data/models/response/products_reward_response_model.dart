import 'dart:convert';

class ProductsRewardResponseModel {
  List<Datum>? data;

  ProductsRewardResponseModel({
    this.data,
  });

  factory ProductsRewardResponseModel.fromJson(String str) => ProductsRewardResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductsRewardResponseModel.fromMap(Map<String, dynamic> json) => ProductsRewardResponseModel(
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
  int? regularPoint;
  int? largePoint;
  String? category;
  String? image;
  bool? stock;

  Datum({
    this.id,
    this.name,
    this.description,
    this.regularPoint,
    this.largePoint,
    this.category,
    this.image,
    this.stock,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    regularPoint: json["regular_point"],
    largePoint: json["large_point"],
    category: json["category"],
    image: json["image"],
    stock: json["stock"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "regular_point": regularPoint,
    "large_point": largePoint,
    "category": category,
    "image": image,
    "stock": stock,
  };
}
