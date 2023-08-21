import 'package:cookcare/core/utils/parse_json.dart';
import 'package:cookcare/ui/screen/meal/meal_screen.dart';
import 'package:flutter/material.dart';
import 'package:cookcare/core/models/card_model.dart';

class LMScreenView extends StatelessWidget {
  const LMScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TCardModel>>(
        future: JsonParser.getCategoryData(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.error != null) return Center(child: Text('数据加载失败'));
          final categories = snapshot.data;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                childAspectRatio: 1.2),
            itemCount: categories?.length,
            itemBuilder: (ctx, index) {
              return buildGridViewItem(context,categories![index]);
            },
          );
        });
  }

  Widget buildGridViewItem(context,TCardModel item) {
    return GestureDetector(
      child: Card(
        child: Center(
            child: Text(item.title,
                style: TextStyle(fontSize: 18, color: item.colorHex))),
      ),
      onTap: (){
        Navigator.pushNamed(context, MealScreen.routeName,arguments: item);
      },
    );
  }
}
