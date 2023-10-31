import 'package:cookcare/core/models/meal_model.dart';
import 'package:cookcare/core/provider/base_meal.dart';

class StarProvider extends BaseMeal{
  final List<MealModel> _staredMeals = [];

  void add(MealModel m){
    _staredMeals.add(m);
    notifyListeners();
  }

  void remove(MealModel m){
    _staredMeals.remove(m);
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
    return _staredMeals.contains(m);
  }

  List<MealModel>  get staredMeals {
    return filter(_staredMeals);
  }
}