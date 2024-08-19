import 'dart:convert';

class VoucherActiveResponseModel {
  List<ActiveVoucher>? activeVouchers;

  VoucherActiveResponseModel({
    this.activeVouchers,
  });

  factory VoucherActiveResponseModel.fromJson(String str) => VoucherActiveResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VoucherActiveResponseModel.fromMap(Map<String, dynamic> json) => VoucherActiveResponseModel(
    activeVouchers: json["active_vouchers"] == null ? [] : List<ActiveVoucher>.from(json["active_vouchers"]!.map((x) => ActiveVoucher.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "active_vouchers": activeVouchers == null ? [] : List<dynamic>.from(activeVouchers!.map((x) => x.toMap())),
  };
}

class ActiveVoucher {
  int? id;
  String? title;
  String? description;
  String? image;
  int? discount;
  int? minTransaction;
  int? maxDiscount;
  bool? isUsed;
  DateTime? startDate;
  DateTime? endDate;

  ActiveVoucher({
    this.id,
    this.title,
    this.description,
    this.image,
    this.discount,
    this.minTransaction,
    this.maxDiscount,
    this.isUsed,
    this.startDate,
    this.endDate,
  });

  factory ActiveVoucher.fromJson(String str) => ActiveVoucher.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ActiveVoucher.fromMap(Map<String, dynamic> json) => ActiveVoucher(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    discount: json["discount"],
    minTransaction: json["min_transaction"],
    maxDiscount: json["max_discount"],
    isUsed: json["is_used"],
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
    "is_used": isUsed,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
  };
}
