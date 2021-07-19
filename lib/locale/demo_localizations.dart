import 'package:flutter/material.dart';
import 'package:mobile_programming/locale/languages/en.dart';
import 'package:mobile_programming/locale/languages/hi.dart';

///Created by Naman Gupta on 19/4/21.

class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': EN.english,
    'hi': HI.hindi,
  };

  String? get title => _localizedValues[locale.languageCode]?['get_started'];
  String? get welcome_to =>
      _localizedValues[locale.languageCode]?['welcome_to'];
  String? get clear => _localizedValues[locale.languageCode]?['clear'];
  String? get tap_or_swipe =>
      _localizedValues[locale.languageCode]?['tap_or_swipe'];
  String? get to_begin => _localizedValues[locale.languageCode]?['to_begin'];
  String? get tap_and_hold =>
      _localizedValues[locale.languageCode]?['tap_and_hold'];
  String? get to_pick_an_item =>
      _localizedValues[locale.languageCode]?['to_pick_an_item'];
}
