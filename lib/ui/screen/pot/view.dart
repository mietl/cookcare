import 'package:cookcare/core/provider/star_provider.dart';
import 'package:cookcare/core/widgets/card_meal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class buildPotView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<StarProvider>(
        builder: (ctx,vm,child){
          if(vm.staredMeals.isEmpty){
            return const Center(
                child:Text('还没得收藏，快去添加吧!')
            );
          }
          final color = Theme.of(context).colorScheme.inversePrimary;

          return ListView.builder(
              itemCount: vm.staredMeals.length,
              itemBuilder: (ctx,index){
                return TMealCard(vm.staredMeals[index],color);
             }
          );
        }
    );
  }
}