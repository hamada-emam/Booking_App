import 'package:booking_app/src/app/core/utils/assets_manager.dart';

class BoradingModel {
 final String img;
 final String tit;
 final String sub;
  BoradingModel({
    required this.img,
    required this.tit,
    required this.sub,
  });

}

 List<BoradingModel> onboradings = [
    BoradingModel(
        img: AssetsManager.onboardingImage[0],
        tit: "Plan your trips",
        sub: "book one of your unique hotel to escape the ordinary"),
    BoradingModel(
        img: AssetsManager.onboardingImage[1],
      tit: "Best travelling all time",
        sub: "Find deals for any season from cosy country homes to city flats"),
    
    BoradingModel(
        img: AssetsManager.onboardingImage[2],
        tit: "Best travelling  add time",
        sub: "Find deals for any season from cosy country homes to city flats"),
  ];
 