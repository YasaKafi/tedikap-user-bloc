import 'dart:convert';

class BannerResponseModel {
  List<BannerData>? data;

  BannerResponseModel({
    this.data,
  });

  factory BannerResponseModel.fromJson(String str) => BannerResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BannerResponseModel.fromMap(Map<String, dynamic> json) => BannerResponseModel(
    data: json["data"] == null ? [] : List<BannerData>.from(json["data"]!.map((x) => BannerData.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class BannerData {
  int? id;
  String? image;

  BannerData({
    this.id,
    this.image,
  });

  factory BannerData.fromJson(String str) => BannerData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BannerData.fromMap(Map<String, dynamic> json) => BannerData(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "image": image,
  };
}
