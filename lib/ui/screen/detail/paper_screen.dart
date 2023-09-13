import 'package:cookcare/core/models/meal_model.dart';
import 'package:cookcare/core/provider/stared_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './view.dart';

class PaperScreen extends StatelessWidget {
  static const String routeName = '/paper';

  const PaperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MealModel meal = ModalRoute.of(context)?.settings.arguments as MealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: PaperView(meal),
      floatingActionButton: TFloatButton(meal),
    );
  }


  TFloatButton(MealModel meal){
    return Consumer<StarProvider>(
        builder: (ctx,vm,child){
          final isStar = vm.isStar(meal);
          final staredData = isStar?Icons.star:Icons.star_border_sharp;
          final iconColor = isStar?Colors.red:null;
          return  FloatingActionButton(
            child:Icon(staredData),
             onPressed: (){
               vm.action(meal);
             }
          );
        }
      );
  }
}
