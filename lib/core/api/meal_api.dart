import 'package:cookcare/core/api/api_constants.dart';
import 'package:cookcare/core/models/meal_model.dart';
import 'package:cookcare/core/utils/http.dart';

class MealApi {
  static Future<List<MealModel>> getMealData() async {
    // 1. 发送请求
    final result = await HttpUtils().get(ApiConstans.meal);

    //2. json转model
    List<MealModel> mealArr = result.data['meal'].map<MealModel>((item) {
      return MealModel.fromJson(item);
    }).toList();

    return mealArr;
  }
}
