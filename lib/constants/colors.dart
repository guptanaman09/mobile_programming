///Created by Naman Gupta on 15/7/21.

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryColor = Color(0xffFF6E00);
  static const Color primaryColorLight = Color(0xffFFF6EF);
  static const Color lightOrange = Color(0xffFFF6EF);
  static const Color primaryColorDark = Color(0xff941214);

  static const Color secondaryColor = Color(0xff230D76);
  static const Color secondaryColorLight = Color(0xff3A16C2);
  static const Color secondaryColorDark = Color(0xff082554);

  static const LinearGradient gradientToggleButton =
      LinearGradient(colors: [Color(0xFFFF872C), Color(0xFFEF6700)]);

  static const LinearGradient gradientButtonTransparent =
      LinearGradient(colors: [Colors.white, Colors.white]);

  static const LinearGradient gradientButton = LinearGradient(colors: [
    Color(0xFFEF6700),
    Color(0xFFFF872C),
  ]);

  static const Color textOnPrimary = Colors.white;
  static const Color screenBackground = Color(0xFFF9FAFB);
  static const Color textOnSecondary = Colors.white;
  static const Color gradient2 = Colors.white;
  static const Color extraInfoBackgroundColor = Color(0xFFEEF0F6);
  static const Color toggleButtonBorderColor = Color(0xFFB1B1B1);
  static const Color newButtonColor = Color(0xFF3D3D3D);
  static const Color newLightGrey = Color(0xFFF6F6F6);

  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;
  static const Color overlapColor = Color(0xFF063A55);
  static const Color black = Color(0xFF000000);
  static const Color blackReplacement = Color(0xFF333333);

  static const simmer_base_color = Color(0xFF88c7e9);
  static const simmer_highlight_color = Color(0xFFEFF1F9);

  static const graphBackgroundGradientColor = LinearGradient(colors: [
    Color.fromRGBO(156, 171, 194, 0),
    Color.fromRGBO(175, 214, 255, 0.5463),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const fullViewGraphBackgroundGradientColor = LinearGradient(colors: [
    Color.fromRGBO(156, 171, 194, 0),
    Color.fromRGBO(175, 214, 255, 0.5463),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static Color grey_3 = Color(0xFF828282);
  static Color grey_2 = Color(0xFF4F4F4F);
  static Color grey_4 = Color(0xFF818181);
  static const Color darkText = Color(0xFF333333);

  static Color grey_6 = Color(0xFFF2F2F2);
  static Color border_color = Color(0xFFBDBDBD);
  static Color green = Color(0xFF449505);
  static Color link_text_color = Color(0xFF4873CB);

  static const Color tileBackgroundColor = Color(0xFFFFE3CD);
  static const Color seperatorColor = Color(0xFFCCCCCC);

  static Color grey_7 = Color(0xFFF4F4F4);
  static Color grey_8 = Color(0xFFE0E0E0);
  static Color grey_9 = Color(0xFF656565);
  static Color grey_10 = Color(0xFFF5F5F5);
  static Color grey_11 = Color(0xFF5C5C5C);
  static Color grey_12 = Color(0xFF666666);
  static Color lighBackground = Color(0xFCFCFC);
  static Color cardColor = Color(0xFFF2F7FA).withOpacity(0.70);
  static Color dashBoardTitle = Color(0xFF3D3D3D);

  static Color tileBookmark = Color(0xFFEDF2FF);
  static Color tileSimilar = Color(0xFFE7FCED);
  static Color tileCost = Color(0xFFFCEFE7);
  static Color tileHist = Color(0xFFE7F4FB);
  static Color tilePrice = Color(0xFFF2EDFF);
  static Color tileNews = Color(0xFFFBE7FA);

  static Color textBookmark = Color(0xFF25469C);
  static Color textSimilar = Color(0xFF38A456);
  static Color textCost = Color(0xFFDF5500);
  static Color textHist = Color(0xFF0072AF);
  static Color textPrice = Color(0xFF4114B1);
  static Color textNews = Color(0xFF90468D);
  static Color text_diff_black = Color(0xFF353535);
}
