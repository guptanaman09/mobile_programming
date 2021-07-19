import 'package:flutter/material.dart';
import 'package:mobile_programming/data/my_shared_preference.dart';
import 'package:mobile_programming/locale/demo_localizations.dart';
import 'package:mobile_programming/locale/demo_localizations_delegate.dart';

///Created by Naman Gupta on 19/4/21.

class AppLocalizations {
  static late DemoLocalizations strings;

  AppLocalizations() {
    strings = DemoLocalizations(Locale('en'));
    setValues();
  }

  void setValues() async {
    if (await MySharedPreference.getString(
                MySharedPreference.STORED_LANGUAGE) !=
            null &&
        await MySharedPreference.getString(
                MySharedPreference.STORED_LANGUAGE) !=
            '') {
      String storedLanguage = (await MySharedPreference.getString(
          MySharedPreference.STORED_LANGUAGE))!;
      strings = await DemoLocalizationsDelegate().load(Locale(storedLanguage));
    } else {
      strings = await DemoLocalizationsDelegate().load(Locale('en'));
    }
  }
}
