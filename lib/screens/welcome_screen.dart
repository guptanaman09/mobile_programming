import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_programming/base/base_class.dart';
import 'package:mobile_programming/constants/dimensions.dart';
import 'package:mobile_programming/locale/app_localizations.dart';
import 'package:mobile_programming/models/welcome_model.dart';
import 'package:mobile_programming/stores/splash/welcome_store.dart';
import 'package:mobile_programming/widgets/bordered_button.dart';
import 'package:mobile_programming/widgets/edit_text_view.dart';
import 'package:mobile_programming/widgets/text_view.dart';
import 'package:mobile_programming/widgets/vertical_gap.dart';

///Created by Naman Gupta on 15/7/21.

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WelcomeScreenState();
  }
}

class WelcomeScreenState extends BaseClass {
  late WelcomeStore welcomeStore;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    welcomeStore = WelcomeStore(context);
  }

  @override
  Widget? setBody() {
    return Container(
        margin:
            EdgeInsets.all(welcomeStore.current < 5 ? Dimensions.size_32 : 0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            imageSlider(),
            welcomeStore.current >= 5
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: Dimensions.size_16),
                      child: dotIndicators(),
                    ),
                  )
                : Positioned(
                    top: Dimensions.size_100,
                    child: dotIndicators(),
                    left: MediaQuery.of(context).size.width * 0.25,
                  ),
          ],
        ));
  }

  Widget upperTitleLayout() {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextView(
              WelcomeModel.getList()[welcomeStore.current].title,
              size: Dimensions.size_18,
            ),
            VerticalGap(Dimensions.size_16),
            TextView(WelcomeModel.getList()[welcomeStore.current].subTitle)
          ],
        ),
      ),
    );
  }

  Widget dotIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: WelcomeModel.getList().asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => welcomeStore.controller.animateToPage(entry.key),
          child: Container(
            width: 12.0,
            height: 12.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                    .withOpacity(
                        welcomeStore.current == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }

  Widget imageSlider() {
    return Container(
      child: CarouselSlider(
        items: WelcomeModel.getList().map(
          (model) {
            if (welcomeStore.current < 5)
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  upperTitleLayout(),
                  VerticalGap(Dimensions.size_50),
                  VerticalGap(Dimensions.size_30),
                  Expanded(
                      child: Container(
                          child: Center(
                              child: Image.asset(
                    model.imageUrl,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.60,
                  ))))
                ],
              );
            else if (welcomeStore.current == 5)
              return useICloud();
            else
              return emailLayout();
          },
        ).toList(),
        carouselController: welcomeStore.controller,
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            autoPlay: false,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                welcomeStore.current = index;
              });
            }),
      ),
    );
  }

  Widget useICloud() {
    return Container(
      padding: EdgeInsets.all(Dimensions.size_26),
      color: Colors.amberAccent,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            WelcomeModel.getList()[0].imageUrl,
            fit: BoxFit.cover,
            height: 150,
            width: 200,
          ),
          VerticalGap(Dimensions.size_50),
          RichText(
              text: TextSpan(
                  text: "Use",
                  style: TextStyle(
                      fontSize: Dimensions.size_26, color: Colors.black),
                  children: [
                TextSpan(
                    text: " iCloud",
                    style: TextStyle(
                        fontSize: Dimensions.size_26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                TextSpan(
                    text: "?",
                    style: TextStyle(
                        fontSize: Dimensions.size_26, color: Colors.black))
              ])),
          VerticalGap(Dimensions.size_30),
          TextView(
            "Storing your lists in iCloud allows you to keep your data in sync across your iPhone, iPad, Mac",
            size: Dimensions.size_18,
          ),
          VerticalGap(Dimensions.size_40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              BorderdButton(
                  TextView(
                    "Not Now",
                    isBool: false,
                    size: Dimensions.size_20,
                  ),
                  welcomeStore.onNotNow),
              BorderdButton(
                  TextView(
                    "use iCloud",
                    isBool: true,
                    size: Dimensions.size_20,
                  ),
                  welcomeStore.onUSeICloud)
            ],
          )
        ],
      ),
    );
  }

  Widget emailLayout() {
    return Container(
      color: Colors.white24,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Dimensions.size_32),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextView(
                "Sign up to the news letter and unlock a theme for yours list",
                size: Dimensions.size_18,
              ),
              VerticalGap(Dimensions.size_50),
              Image.asset(
                WelcomeModel.getList()[0].imageUrl,
                fit: BoxFit.cover,
                height: 200,
                width: 200,
              ),
              VerticalGap(Dimensions.size_50),
              EditTextView("Email Address", welcomeStore.textEditingController),
              VerticalGap(Dimensions.size_30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  BorderdButton(
                      TextView(
                        "Skip",
                        isBool: false,
                        size: Dimensions.size_20,
                      ),
                      welcomeStore.onSkip),
                  BorderdButton(
                      TextView(
                        "Join",
                        isBool: true,
                        size: Dimensions.size_20,
                      ),
                      welcomeStore.onJoin)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
