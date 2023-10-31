import 'package:cookcare/core/provider/filter_provider.dart';
import 'package:cookcare/core/provider/star_provider.dart';
import 'package:flutter/material.dart';

import 'package:cookcare/core/router/router.dart';

import 'package:provider/provider.dart';

import 'core/provider/meal_provider.dart';


import 'core/utils/screen_kit.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx)=>FilterProvider()),
        // 将FilterPrvider代理到MealProvider中
        ChangeNotifierProxyProvider<FilterProvider,MealProvider>(
              create: (ctx)=>MealProvider(),
              update: (_,filterModel,mealModel){
                if (mealModel == null) throw ArgumentError.notNull('mealModel');
                mealModel.update(filterModel);
                return  mealModel;
              }
        ),
        ChangeNotifierProxyProvider<FilterProvider,StarProvider>(
            create: (ctx)=>StarProvider(),
            update: (_,filterModel,starModel){
              if (starModel == null) throw ArgumentError.notNull('starModel');
              starModel.update(filterModel);
              return  starModel;
            }
        ),
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
      onGenerateRoute: TRouter.onGenerateRoute,
    );
  }
}
