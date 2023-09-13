import 'package:flutter/material.dart';

class TIconButton extends StatelessWidget {
  final String text;
  final Widget icon;
  final Color textColor;
  final VoidCallback? onPressed;

  TIconButton(
    this.icon,
    this.text,
    {textColor,this.onPressed}
  ):textColor=Color(0xFF424242);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          minimumSize: MaterialStatePropertyAll(
            Size(100,48)
          )
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [icon, Text(text)],
        ));
  }
}
