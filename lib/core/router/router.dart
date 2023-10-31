import 'package:cookcare/ui/screen/detail/paper_screen.dart';
import 'package:cookcare/ui/screen/entry/index_screen.dart';
import 'package:cookcare/ui/screen/filter/filter_screen.dart';
import 'package:cookcare/ui/screen/meal/meal_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TRouter {
  static const String initialRoute = IndexScreen.routeName;

  static final Map<String,WidgetBuilder> routes = {
    IndexScreen.routeName:(ctx)=> const IndexScreen(),
    MealScreen.routeName:(ctx)=> MealScreen(),
    PaperScreen.routeName:(ctx)=> const PaperScreen()
  };

  static Route<dynamic>? onGenerateRoute(settings){
    if(settings.name == FilterScreen.routeName){
      return MaterialPageRoute(builder: (ctx)=> FilterScreen(),fullscreenDialog: true);
    }
    return null;
  }

}