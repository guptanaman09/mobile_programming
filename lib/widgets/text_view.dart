import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Created by Naman Gupta on 15/7/21.

class TextView extends StatelessWidget {
  final String text;
  final double size;
  final Color textColor;
  final isBool;
  final TextAlign textAlign;

  TextView(this.text,
      {this.size = 14,
      this.textColor = Colors.black,
      this.isBool = false,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: textColor,
        fontWeight: isBool ? FontWeight.bold : FontWeight.normal,
      ),
      textAlign: textAlign,
    );
  }
}
