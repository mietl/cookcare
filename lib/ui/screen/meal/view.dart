import 'package:cookcare/core/models/card_model.dart';
import 'package:cookcare/core/models/meal_model.dart';
import 'package:cookcare/core/provider/meal_provider.dart';
import 'package:cookcare/core/widgets/icon_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealView extends StatelessWidget {
  final TCardModel category;
  const MealView(this.category);

  @override
  Widget build(BuildContext context) {
    return Selector<MealProvider, List<MealModel>>(
      selector: (ctx, vm) {
        return vm.meals
            .where((item) => item.categories?.contains(category.id) ?? false)
            .toList();
      },
      builder: (ctx, data, child) {
        return ListView.builder(
          itemBuilder: (context, index) => buildMealItem(data[index]),
          itemCount: data.length,
        );
      },
      shouldRebuild: (previous, next) {
        return !listEquals(previous, next);
      },
    );
  }

  // 这里就不抽了，麻烦
  buildMealItem(item) {
    return Card(
      margin: const EdgeInsets.all(12),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [buildBio(item), buildAction(item)],
      ),
    );
  }

  buildBio(MealModel item) {
    return Stack(
      children: [
        Image.network(item.imageUrl!,
            width: double.infinity, fit: BoxFit.cover),
        Positioned(
            left: 0,
            right: 12,
            bottom: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(6)),
                gradient: LinearGradient(colors: [
                  const Color(0xFFf3c5b9),
                  category.colorHex.withOpacity(.1),
                ]),
              ),
              child: Text(
                item.title!,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ))
      ],
    );
  }

  buildAction(MealModel item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TIconButton(Icon(Icons.schedule), '${item.duration} min'),
        TIconButton(Icon(Icons.restaurant), '${item.complexityText}'),
        TIconButton(Icon(Icons.star), 'star ${item.title}')
      ],
    );
  }
}
