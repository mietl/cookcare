import 'package:cookcare/core/models/card_model.dart';
import 'package:cookcare/core/models/meal_model.dart';
import 'package:cookcare/core/provider/meal_provider.dart';
import 'package:cookcare/core/widgets/card_meal.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealView extends StatelessWidget {
  final TCardModel category;

  const MealView(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<MealProvider, List<MealModel>>(
      selector: (ctx, vm) {
        print('update');
        return vm.meals
            .where((item) => item.categories.contains(category.id))
            .toList();
      },
      builder: (ctx, data, child) {
        final barColor =  category.colorHex;
        return ListView.builder(
          itemBuilder: (context, index) => TMealCard(data[index],barColor),
          itemCount: data.length,
        );
      },
      shouldRebuild: (previous, next) {
        return !listEquals(previous, next);
      },
    );
  }
}
