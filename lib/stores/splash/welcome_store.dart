import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobile_programming/routing/route_class.dart' as route;

///Created by Naman Gupta on 16/7/21.

part 'welcome_store.g.dart';

class WelcomeStore = _WelcomeStore with _$WelcomeStore;

abstract class _WelcomeStore with Store {
  late BuildContext _buildContext;
  late CarouselController controller;
  late TextEditingController textEditingController;

  @observable
  int current = 0;

  _WelcomeStore(BuildContext context) {
    _buildContext = context;
    controller = CarouselController();
    textEditingController = TextEditingController();
  }

  @action
  void setCurrentIndex(int val) {
    current = 0;
  }

  @action
  void onNotNow() {
    print("not now");
  }

  @action
  void onUSeICloud() {
    print("use i cloud");
  }

  @action
  void onSkip() {
    Navigator.pushNamed(_buildContext, route.listScreen);
  }

  @action
  void onJoin() {
    print("on Join");
  }
}
