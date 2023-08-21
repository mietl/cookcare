import 'package:cookcare/ui/screen/entry/index_screen.dart';
import 'package:cookcare/ui/screen/meal/meal_screen.dart';
import 'package:flutter/cupertino.dart';

class TRouter {
  static const String initialRoute = IndexScreen.routeName;

  static final Map<String,WidgetBuilder> routes = {
    IndexScreen.routeName:(ctx)=> const IndexScreen(),
    MealScreen.routeName:(ctx)=> MealScreen()
  };

}