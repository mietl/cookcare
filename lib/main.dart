import 'package:cookcare/core/provider/stared_provider.dart';
import 'package:flutter/material.dart';

import 'package:cookcare/core/router/router.dart';

import 'package:provider/provider.dart';

import 'core/provider/meal_provider.dart';


import 'core/utils/screen_kit.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(ctx)=>MealProvider()),
        ChangeNotifierProvider(create:(ctx)=>StarProvider())
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenKit.init(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFf3c5b9)),
        useMaterial3: true,
      ),
      routes: TRouter.routes,
      initialRoute: TRouter.initialRoute,
    );
  }
}
