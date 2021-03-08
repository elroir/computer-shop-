import 'dart:convert';

ConfigurationModel configurationModelFromJson(String str) => ConfigurationModel.fromJson(json.decode(str));

String configurationModelToJson(ConfigurationModel data) => json.encode(data.toJson());

class ConfigurationModel {
  ConfigurationModel({
    this.objectId,
    this.cpu,
    this.createdAt,
    this.updatedAt,
    this.ram,
    this.storage,
    this.gpu,
    this.laptopId,
    this.price,
  });

  String objectId;
  String cpu;
  DateTime createdAt;
  DateTime updatedAt;
  String ram;
  String storage;
  String gpu;
  LaptopId laptopId;
  int price;

  factory ConfigurationModel.fromJson(Map<String, dynamic> json) => ConfigurationModel(
    objectId: json["objectId"],
    cpu: json["cpu"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    ram: json["ram"],
    storage: json["storage"],
    gpu: json["gpu"],
    laptopId: LaptopId.fromJson(json["laptopId"]),
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "objectId": objectId,
    "cpu": cpu,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "ram": ram,
    "storage": storage,
    "gpu": gpu,
    "laptopId": laptopId.toJson(),
    "price": price,
  };
}

class LaptopId {
  LaptopId({
    this.type,
    this.className,
    this.objectId,
  });

  String type;
  String className;
  String objectId;

  factory LaptopId.fromJson(Map<String, dynamic> json) => LaptopId(
    type: json["__type"],
    className: json["className"],
    objectId: json["objectId"],
  );

  Map<String, dynamic> toJson() => {
    "__type": type,
    "className": className,
    "objectId": objectId,
  };
}
