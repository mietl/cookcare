import 'package:cookcare/core/models/meal_model.dart';
import 'package:flutter/material.dart';

import 'package:cookcare/core/api/meal_api.dart';

class MealProvider with ChangeNotifier {
  List<MealModel> _meals = [];

  List<MealModel> get meals {
    return _meals;
  }

  MealProvider() {
    MealApi.getMealData().then((data) {
      _meals = data;
    });
    notifyListeners();
  }
}
