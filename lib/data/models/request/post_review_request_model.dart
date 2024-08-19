import 'dart:convert';

class PostReviewRequestModel {
  double? staffService;
  double? productQuality;
  String? note;

  PostReviewRequestModel({
    this.staffService,
    this.productQuality,
    this.note,
  });

  factory PostReviewRequestModel.fromJson(String str) => PostReviewRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostReviewRequestModel.fromMap(Map<String, dynamic> json) => PostReviewRequestModel(
    staffService: json["staff_service"]?.toDouble(),
    productQuality: json["product_quality"]?.toDouble(),
    note: json["note"],
  );

  Map<String, dynamic> toMap() => {
    "staff_service": staffService,
    "product_quality": productQuality,
    "note": note,
  };
}
