import 'package:flutter/material.dart';
import 'package:mobile_programming/screens/list_screen.dart';
import 'package:mobile_programming/screens/splash_screen.dart';
import 'package:mobile_programming/screens/welcome_screen.dart';

///Created by Naman Gupta on 15/7/21.
const String splash = "/";
const String welcomeScreen = "/welcomeScreen";
const String listScreen = "/listScreen";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splash:
      return MaterialPageRoute(
        builder: (_) => SplashScreen(),
      );

    case welcomeScreen:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            WelcomeScreen(),
        transitionsBuilder: (context, animation, secAniamtion, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.fastOutSlowIn;

          var tween = Tween(begin: begin, end: end);
          var curvedAnimation =
              CurvedAnimation(curve: curve, parent: animation);

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        },
      );

    case listScreen:
      return MaterialPageRoute(builder: (_) => ListScreen());

    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}
