import 'package:cookcare/core/models/meal_model.dart';
import 'package:flutter/material.dart';

class StarProvider extends ChangeNotifier{
  final List<MealModel> staredMeals = [];

  void add(MealModel m){
    staredMeals.add(m);
    notifyListeners();
  }

  void remove(MealModel m){
    staredMeals.remove(m);
    notifyListeners();
  }

  void action(MealModel m){
    if(isStar(m)){
      remove(m);
    }else{
      add(m);
    }
  }

  bool isStar(MealModel m){
    return staredMeals.contains(m);
  }
}