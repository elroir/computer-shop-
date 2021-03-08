

import 'package:design_patterns/models/part_model.dart';

class Parts {

  static Parts _instance = Parts();
  static Parts get instance => _instance;

  List<PartModel> parts = [];
  String imageUrl = '';


}