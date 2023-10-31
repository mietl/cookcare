import 'package:flutter/material.dart';

import './view.dart';

class FilterScreen extends StatelessWidget{
  static const String routeName = '/filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('过滤设置'),
      ),
      body: FilterView(),
    );
  }
}