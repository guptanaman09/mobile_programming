import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_programming/base/base_class.dart';
import 'package:mobile_programming/constants/dimensions.dart';
import 'package:mobile_programming/locale/app_localizations.dart';
import 'package:mobile_programming/stores/splash/splash_store.dart';
import 'package:mobile_programming/widgets/text_view.dart';
import 'package:mobile_programming/widgets/vertical_gap.dart';

///Created by Naman Gupta on 15/7/21.

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends BaseClass {
  late SplashStore _splashStore;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _splashStore = SplashStore(this);
  }

  @override
  Widget setBody() {
    return GestureDetector(
      onHorizontalDragUpdate: (dragDetails) {
        double x = dragDetails.delta.dx;
        if (x > 5 || x < -5) {
          _splashStore.goToWelcomeScreen(context);
        }
      },
      onTap: () => _splashStore.goToWelcomeScreen(context),
      child: Container(
        color: Colors.pinkAccent.shade100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              RichText(
                text: TextSpan(
                    text: AppLocalizations.strings.welcome_to,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: AppLocalizations.strings.clear,
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              color: Colors.black))
                    ]),
              ),
              VerticalGap(Dimensions.size_20),
              RichText(
                text: TextSpan(
                    text: AppLocalizations.strings.tap_or_swipe,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: AppLocalizations.strings.to_begin,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.black))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
