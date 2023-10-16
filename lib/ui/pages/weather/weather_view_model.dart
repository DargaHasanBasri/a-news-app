import 'package:a_news_app/base/base_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/response/current_weather_response_model.dart';
import '../../../models/response/fore_cast_response_model.dart';

class WeatherViewModel extends BaseViewModel {

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

  ValueNotifier<CurrentWeatherResponseModel?> currentWeatherResponseNotifier = ValueNotifier(null);
  ValueNotifier<ForeCastResponseModel?> foreCastHourlyWeatherResponseNotifier = ValueNotifier(null);

  void fetchCurrentWeather(String cityName) async {
    final response = await repository.getCurrentWeather(cityName);
    currentWeatherResponseNotifier.value = response;
  }

  void fetchForeCastHourlyWeather(String? cityName, int? howDay) async {
    final response = await repository.getForeCastHourlyWeather(cityName, howDay);
    foreCastHourlyWeatherResponseNotifier.value = response;
  }
}
