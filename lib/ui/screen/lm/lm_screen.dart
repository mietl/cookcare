import 'package:flutter/material.dart';
import './view.dart';
import './lm_drawer.dart';

class LMScreen extends StatelessWidget {
  const LMScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('L'),
        leading: IconButton(
              icon: Icon(Icons.menu), // 自定义按钮图标
              onPressed: () {
                // 打开 index_screen scaffold弹出抽屉
                Scaffold.of(context).openDrawer(); // 打开抽屉
              },
        ),
      ),
      body: const LMScreenView(),
    );
  }
}
