import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_programming/constants/dimensions.dart';
import 'package:mobile_programming/widgets/text_view.dart';

///Created by Naman Gupta on 16/7/21.

class BorderdButton extends StatelessWidget {
  late TextView textView;
  Function onClick;

  BorderdButton(this.textView, this.onClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.size_12, vertical: Dimensions.size_8),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: Dimensions.size_1),
            borderRadius: BorderRadius.circular(Dimensions.size_8)),
        child: Center(child: textView),
      ),
    );
  }
}
