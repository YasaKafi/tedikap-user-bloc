import 'dart:convert';

class DetailVoucherResponseModel {
  Data? data;

  DetailVoucherResponseModel({
    this.data,
  });

  factory DetailVoucherResponseModel.fromJson(String str) => DetailVoucherResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailVoucherResponseModel.fromMap(Map<String, dynamic> json) => DetailVoucherResponseModel(
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "data": data?.toMap(),
  };
}

class Data {
  int? id;
  String? title;
  String? description;
  String? image;
  int? discount;
  int? minTransaction;
  int? maxDiscount;
  DateTime? startDate;
  DateTime? endDate;

  Data({
    this.id,
    this.title,
    this.description,
    this.image,
    this.discount,
    this.minTransaction,
    this.maxDiscount,
    this.startDate,
    this.endDate,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    discount: json["discount"],
    minTransaction: json["min_transaction"],
    maxDiscount: json["max_discount"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "description": description,
    "image": image,
    "discount": discount,
    "min_transaction": minTransaction,
    "max_discount": maxDiscount,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
  };
}
