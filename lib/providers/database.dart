import 'dart:convert';

import 'package:design_patterns/env.dart';
import 'package:design_patterns/models/configuration_model.dart';
import 'package:design_patterns/models/laptop_model.dart';
import 'package:design_patterns/models/part_model.dart';
import 'package:design_patterns/providers/parts.dart';
import 'package:http/http.dart' as http;

class Database {

  static Future<List<PartModel>> getMotherboards() async {

    List<PartModel> parts = [];

    try{
      final headers = {
        "X-Parse-Application-Id": Env.appId,
        "X-Parse-REST-API-Key"  : Env.apiKey
      };
      final resp = await http.get('${Env.dbUrl}/classes/motherboard',headers: headers);
      final Map<String,dynamic> data = json.decode(resp.body);
      data['results'].forEach((element) {
        parts.add(PartModel.fromJson(element));

      });
      return parts;
    }catch (e){
      print(e);
      return [];
    }
  }

  static Future<List<LaptopModel>> getLaptops() async {

    List<LaptopModel> laptops = [];

    try{
      final headers = {
        "X-Parse-Application-Id": Env.appId,
        "X-Parse-REST-API-Key"  : Env.apiKey
      };
      final resp = await http.get('${Env.dbUrl}/classes/laptop',headers: headers);
      final Map<String,dynamic> data = json.decode(resp.body);

      data['results'].forEach((element) {
        laptops.add(LaptopModel.fromJson(element));
      });
      return laptops;
    }catch (e){
      print(e);
      return [];
    }
  }

  static Future<List<PartModel>> getParts() async {

    List<PartModel> parts = [];

    try{
      final headers = {
        "X-Parse-Application-Id": Env.appId,
        "X-Parse-REST-API-Key"  : Env.apiKey
      };
      final resp = await http.get('${Env.dbUrl}/classes/part',headers: headers);
      final Map<String,dynamic> data = json.decode(resp.body);
      data['results'].forEach((element) {
        parts.add(PartModel.fromJson(element));
      });

      List<PartModel> motherboards = await getMotherboards();
      parts.addAll(motherboards);

      Parts.instance.parts = parts;

      return parts;
    }catch (e){
      print(e);
      return [];
    }
  }

  static Future<List<ConfigurationModel>> getConfigurations(String id) async {

    List<ConfigurationModel> configurations = [];

    try{
      final headers = {
        "X-Parse-Application-Id": Env.appId,
        "X-Parse-REST-API-Key"  : Env.apiKey
      };
      final resp = await http.get('${Env.dbUrl}/classes/component?where={"laptopId":{"__type":"Pointer","className":"laptop","objectId":"$id"}}',headers: headers);
      final Map<String,dynamic> data = json.decode(resp.body);

      data['results'].forEach((element) {
        configurations.add(ConfigurationModel.fromJson(element));
      });
      return configurations;
    }catch (e){
      print(e);
      return [];
    }
  }




}