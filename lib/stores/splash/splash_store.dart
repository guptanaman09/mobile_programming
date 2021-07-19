import 'package:flutter/cupertino.dart';
import 'package:mobile_programming/base/base_class.dart';
import 'package:mobile_programming/routing/route_class.dart';
import 'package:mobx/mobx.dart';
import 'package:mobile_programming/routing/route_class.dart' as route;

///Created by Naman Gupta on 15/7/21.

part 'splash_store.g.dart';

class SplashStore = _SplashStore with _$SplashStore;

abstract class _SplashStore with Store {
  late BaseClass _baseClass;

  _SplashStore(BaseClass context) {
    _baseClass = context;
  }

  @action
  void goToWelcomeScreen(BuildContext context) {
    Navigator.of(context).pushNamed(route.welcomeScreen);
  }
}
