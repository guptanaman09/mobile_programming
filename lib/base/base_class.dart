import 'package:flutter/cupertino.dart';

///Created by Naman Gupta on 15/7/21.

import 'package:flutter/material.dart';
import 'package:mobile_programming/constants/colors.dart';

///Created by Naman Gupta on 19/4/21.

class BaseClass extends State {
  Color backgroundColor = AppColors.white;
  bool isLoading = false;
  bool showBottomNavigation = false;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void setIsLoading(bool isLoading) {
    setState(() {
      this.isLoading = isLoading;
    });
  }

  void showInfoBar(String title) {
    scaffoldKey.currentState!.showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      backgroundColor: AppColors.primaryColor,
      content: Text(
        title,
      ),
    ));
  }

  void setBackgroundColor(Color color) {
    backgroundColor = color;
  }

  Widget? setBody() {}

  PreferredSizeWidget getAppBar() {
    return AppBar(
      toolbarHeight: 0,
    );
  }

  void handleDrawerFunctionality() {
    if (scaffoldKey.currentState!.isDrawerOpen)
      scaffoldKey.currentState!.openEndDrawer();
    else
      scaffoldKey.currentState!.openDrawer();
  }

  bool getLoaderState() {
    return isLoading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      key: scaffoldKey,
      body: SafeArea(
          child: Stack(
        overflow: Overflow.visible,
        children: [
          if (isLoading)
            Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black12,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 3.0,
                          ),
                        ),
                      ),
                    ),
                  ]),
            )
          else
            setBody()!
        ],
      )),
      appBar: getAppBar(),
    );
  }
}
