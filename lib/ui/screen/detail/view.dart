import 'package:cookcare/core/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:cookcare/core/utils/extension.dart';

class PaperView extends StatelessWidget {
  late final MealModel _mealItem;
  PaperView(this._mealItem);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        buildCoverImage(),
        buildBlockTitle("制作材料"),
        buildMaterial(context),
        buildBlockTitle("制作工艺"),
        buildCraft(context),
      ]),
    );
  }

  Widget buildCoverImage() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(6),
      // color: Color(0xFF8EC3C6),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(_mealItem.imageUrl)),
    );
  }

  Widget buildBlockTitle(title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget buildMaterial(context) {
    return buildSkinWrap(
        context: context,
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              return Card(
                color: Color(0xFFEFD5CC),
                child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(_mealItem.ingredients[index])),
              );
            },
            itemCount: _mealItem.ingredients.length));
  }

  Widget buildCraft(context) {
    return buildSkinWrap(
        context: context,
        child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                ),
                title: Text(_mealItem.steps[index]),
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider();
            },
            itemCount: _mealItem.steps.length));
  }

  Widget buildSkinWrap({required BuildContext context, required Widget child}) {
    return Container(
      margin: EdgeInsets.all(6.0.px),
      padding: EdgeInsets.all(12.0.px),
      width: MediaQuery.of(context).size.width - 12.px,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFF0908C), width: 1.5),
          borderRadius: BorderRadius.circular(6.0)),
      child: child,
    );
  }
}
