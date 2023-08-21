import 'dart:convert' show jsonDecode;

import 'package:cookcare/core/models/card_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class JsonParser{
  static Future<List<TCardModel>> getCategoryData() async{
   final jsonStr = await rootBundle.loadString('assets/json/category.json');

   final result = jsonDecode(jsonStr);

   final list = result['category'];

   List<TCardModel> categories = [];

   for(var foo in list){
     categories.add(TCardModel.fromJson(foo));
   }

   return categories;
  }
}