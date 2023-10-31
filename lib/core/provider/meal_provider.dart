import 'package:cookcare/core/models/meal_model.dart';

import 'package:cookcare/core/api/meal_api.dart';

import 'base_meal.dart';

class MealProvider extends BaseMeal {
  List<MealModel> _meals = [];


  List<MealModel> get meals {
    return filter(_meals);
  }

  MealProvider() {
    MealApi.getMealData().then((data) {
      _meals = data;
      notifyListeners();
    });
  }
}
