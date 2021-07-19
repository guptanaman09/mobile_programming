// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WelcomeStore on _WelcomeStore, Store {
  final _$currentAtom = Atom(name: '_WelcomeStore.current');

  @override
  int get current {
    _$currentAtom.reportRead();
    return super.current;
  }

  @override
  set current(int value) {
    _$currentAtom.reportWrite(value, super.current, () {
      super.current = value;
    });
  }

  final _$_WelcomeStoreActionController =
      ActionController(name: '_WelcomeStore');

  @override
  void setCurrentIndex(int val) {
    final _$actionInfo = _$_WelcomeStoreActionController.startAction(
        name: '_WelcomeStore.setCurrentIndex');
    try {
      return super.setCurrentIndex(val);
    } finally {
      _$_WelcomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onNotNow() {
    final _$actionInfo = _$_WelcomeStoreActionController.startAction(
        name: '_WelcomeStore.onNotNow');
    try {
      return super.onNotNow();
    } finally {
      _$_WelcomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onUSeICloud() {
    final _$actionInfo = _$_WelcomeStoreActionController.startAction(
        name: '_WelcomeStore.onUSeICloud');
    try {
      return super.onUSeICloud();
    } finally {
      _$_WelcomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSkip() {
    final _$actionInfo = _$_WelcomeStoreActionController.startAction(
        name: '_WelcomeStore.onSkip');
    try {
      return super.onSkip();
    } finally {
      _$_WelcomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onJoin() {
    final _$actionInfo = _$_WelcomeStoreActionController.startAction(
        name: '_WelcomeStore.onJoin');
    try {
      return super.onJoin();
    } finally {
      _$_WelcomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
current: ${current}
    ''';
  }
}
