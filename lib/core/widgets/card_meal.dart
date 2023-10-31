import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:cookcare/core/models/meal_model.dart';

import 'package:cookcare/core/provider/star_provider.dart';
import 'package:cookcare/core/widgets/icon_button.dart';
import 'package:cookcare/ui/screen/detail/paper_screen.dart';

class TMealCard extends StatelessWidget{
  final MealModel item;
  final Color barColor;
  TMealCard(this.item,this.barColor);


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          buildBio(context, item),
          buildAction(item)],
      ),
    );
  }


  buildBio(context, MealModel item) {
    return GestureDetector(
      child: Stack(
        children: [
          FadeInImage.assetNetwork(
            placeholder: 'assets/images/xm.jpg',
            image: item.imageUrl,
            fit: BoxFit.cover,
            imageErrorBuilder: (context, url, error) {
              return Image.asset('assets/images/xm.jpg');
            },
          ),
          Positioned(
              left: 0,
              right: 12,
              bottom: 6,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 7, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(6)),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFf3c5b9),
                    barColor.withOpacity(.1)
                  ]),
                ),
                child: Text(
                  item.title,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ))
        ],
      ),
      onTap: () {
        Navigator.of(context).pushNamed(PaperScreen.routeName, arguments: item);
      },
    );
  }

  buildAction(MealModel item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TIconButton(const Icon(Icons.schedule), '${item.duration} min'),
        TIconButton(const Icon(Icons.restaurant), item.complexityText),
        StarButton(item)
      ],
    );
  }

  Widget StarButton(MealModel meal) {
    return Consumer<StarProvider>(
        builder: (ctx, vm, child) {
          final isStar = vm.isStar(meal);
          final staredData = isStar ? Icons.star : Icons.star_border_sharp;
          // final color = isStar?Colors.red:Color(0xFF424242);
          final text = isStar ? 'stared' : 'star';
          return TIconButton(Icon(staredData), text,
              onPressed: () {
                vm.action(meal);
              }
          );
        }
    );
  }
}