import 'dart:convert';

PartModel partModelFromJson(String str) => PartModel.fromJson(json.decode(str));

String partModelToJson(PartModel data) => json.encode(data.toJson());

class PartModel {


  PartModel({
    this.objectId,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.price,
    this.makeCompatibility,
  });

  String objectId;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  String type;
  int price;
  String makeCompatibility;

  factory PartModel.fromJson(Map<String, dynamic> json) => PartModel(
    objectId: json["objectId"],
    name: json["name"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    type: json["type"],
    price: json["price"],
    makeCompatibility: json["makeCompatibility"],
  );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "name": name,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "type": type,
    "price": price,
    "makeCompatibility": makeCompatibility,
  };
}
