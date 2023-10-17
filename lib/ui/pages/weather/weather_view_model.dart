import 'package:a_news_app/base/base_view_model.dart';

import '../../../models/response/fore_cast_response_model.dart';

class WeatherViewModel extends BaseViewModel {
  final ForeCastResponseModel? foreCastModel;
  WeatherViewModel(this.foreCastModel);

  final List<String> imageAddress = [
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
  ];

  final List<String> imagesAddress2 = [
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
  ];

}
