import 'package:flutter/material.dart';
import '../lm/lm_screen.dart';
import '../pot/pot_screen.dart';
final List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(label:"了米",icon: Icon(Icons.lens_blur_outlined)),
  const BottomNavigationBarItem(label:"手藏",icon: Icon(Icons.savings_rounded))
];

final List<Widget> pages = [
  const LMScreen(),
  PotScreen()
];