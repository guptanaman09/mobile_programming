import 'package:mobile_programming/locale/app_localizations.dart';

///Created by Naman Gupta on 16/7/21.

class WelcomeModel {
  static List<SampleModel> getList() {
    List<SampleModel> modelList = [];

    SampleModel model1 = SampleModel(
        AppLocalizations.strings.tap_and_hold! +
            AppLocalizations.strings.to_pick_an_item!,
        "Drag it up or down to chnage its priority.",
        "assets/images/demo.jpeg");
    modelList.add(model1);

    SampleModel model2 = SampleModel(
        "There are three navigation levels", "", "assets/images/demo.jpeg");
    modelList.add(model2);

    SampleModel model3 = SampleModel(
        "Pinch together vertically to collpase your current level and navigate up",
        "",
        "assets/images/demo.jpeg");
    modelList.add(model3);

    SampleModel model4 = SampleModel("Tap on a list to see its content",
        "Tap on a list title to edit it", "assets/images/demo.jpeg");
    modelList.add(model4);

    SampleModel model5 = SampleModel(
        AppLocalizations.strings.tap_and_hold! +
            AppLocalizations.strings.to_pick_an_item!,
        "Drag it up or down to chnage its priority.",
        "assets/images/demo.jpeg");
    modelList.add(model5);

    SampleModel model6 = SampleModel(
        AppLocalizations.strings.tap_and_hold! +
            AppLocalizations.strings.to_pick_an_item!,
        "Drag it up or down to chnage its priority.",
        "assets/images/demo.jpeg");
    modelList.add(model6);

    SampleModel model7 = SampleModel(
        AppLocalizations.strings.tap_and_hold! +
            AppLocalizations.strings.to_pick_an_item!,
        "Drag it up or down to chnage its priority.",
        "assets/images/demo.jpeg");
    modelList.add(model7);

    return modelList;
  }
}

class SampleModel {
  late String title;
  late String subTitle;
  late String imageUrl;

  SampleModel(this.title, this.subTitle, this.imageUrl);
}
