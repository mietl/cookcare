import 'package:flutter/material.dart';
import './view.dart';

class LMScreen extends StatelessWidget {
  const LMScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('L'),
      ),
      body: const LMScreenView()
    );
  }
}
