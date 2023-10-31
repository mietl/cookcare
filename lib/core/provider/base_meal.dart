import 'package:cookcare/core/models/meal_model.dart';
import 'package:flutter/material.dart';

import 'filter_provider.dart';

class BaseMeal extends ChangeNotifier{
  late FilterProvider filterModel;

  update(FilterProvider filter){
    filterModel  = filter;
    notifyListeners();
  }


  List<MealModel> filter(List<MealModel> meals){
    return meals.where((element){
      if(filterModel.isVegetarian && !element.isVegetarian) return false;
      if(filterModel.isVegan && !element.isVegan) return false;
      if(filterModel.isLactoseFree && !element.isLactoseFree) return false;
      if(filterModel.isGlutenFree && !element.isGlutenFree) return false;
      return true;
    }).toList();
  }


}