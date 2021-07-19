import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_programming/constants/dimensions.dart';

///Created by Naman Gupta on 16/7/21.

class EditTextView extends StatelessWidget {
  String hintText;
  TextEditingController textEditingController;

  EditTextView(this.hintText, this.textEditingController);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.size_16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: Dimensions.size_1),
          borderRadius: BorderRadius.circular(Dimensions.size_8)),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
                horizontal: Dimensions.size_4, vertical: Dimensions.size_6),
            hintText: hintText,
            hintStyle:
                TextStyle(fontSize: Dimensions.size_16, color: Colors.black26),
            labelStyle:
                TextStyle(fontSize: Dimensions.size_16, color: Colors.black)),
      ),
    );
  }
}
