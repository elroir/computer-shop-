import 'dart:convert';

LaptopModel laptopModelFromJson(String str) => LaptopModel.fromJson(json.decode(str));

String laptopModelToJson(LaptopModel data) => json.encode(data.toJson());

class LaptopModel {
  LaptopModel({
    this.objectId,
    this.createdAt,
    this.updatedAt,
    this.make,
    this.model,
    this.pictureUrl
  });

  String objectId;
  DateTime createdAt;
  DateTime updatedAt;
  String make;
  String model;
  String pictureUrl;

  factory LaptopModel.fromJson(Map<String, dynamic> json) => LaptopModel(
    objectId: json["objectId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    make: json["make"],
    model: json["model"],
    pictureUrl: json["pictureUrl"]
  );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "make": make,
    "model": model,
    "pictureUrl" : pictureUrl
  };
}
