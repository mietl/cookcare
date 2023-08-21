import 'package:flutter/material.dart';

class TIconButton extends StatelessWidget {
  final String text;
  final Widget icon;

  TIconButton(
    this.icon,
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [icon, Text(text)],
        ));
  }
}
