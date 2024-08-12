import 'dart:convert';

class StatusOutletResponseModel {
  Data? data;

  StatusOutletResponseModel({
    this.data,
  });

  factory StatusOutletResponseModel.fromJson(String str) => StatusOutletResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StatusOutletResponseModel.fromMap(Map<String, dynamic> json) => StatusOutletResponseModel(
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "data": data?.toMap(),
  };
}

class Data {
  int? statusStore;
  String? description;
  String? session;
  String? time;

  Data({
    this.statusStore,
    this.description,
    this.session,
    this.time,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    statusStore: json["status_store"],
    description: json["description"],
    session: json["session"],
    time: json["time"],
  );

  Map<String, dynamic> toMap() => {
    "status_store": statusStore,
    "description": description,
    "session": session,
    "time": time,
  };
}
