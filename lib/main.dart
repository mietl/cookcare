import 'package:flutter/material.dart';

import 'package:cookcare/core/router/router.dart';

import 'package:provider/provider.dart';

import 'core/provider/meal_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MealProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
