import 'package:flutter/material.dart';
import './view.dart';

class PotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T'),
      ),
      body: buildPotView(),
    );
  }
}
