import 'package:cookcare/core/models/card_model.dart';
import 'package:flutter/material.dart';

import './view.dart';

class MealScreen extends StatelessWidget {
  static const String routeName = '/meal';

  @override
  Widget build(BuildContext context) {
    // 接收参数
    final categroy = ModalRoute.of(context)?.settings.arguments as TCardModel;

    return Scaffold(
      appBar: AppBar(title: Text(categroy.title)),
      body: MealView(categroy),
    );
  }
}
