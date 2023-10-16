import 'package:a_news_app/base/base_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/response/current_weather_response_model.dart';

class WeatherViewModel extends BaseViewModel {

  final List<String> date = [
    "00:00",
    "01:00",
    "02:00",
    "03:00",
    "04:00",
    "00:00",
    "01:00",
  ];

  final List<String> day = [
    "Pazartesi",
    "Salı",
    "Çarşamba",
    "Perşembe",
    "Cuma",
    "Cumartesi",
    "Pazar",
  ];

  final List<String> degrees = [
    "0°",
    "5°",
    "10°",
    "15°",
    "20°",
    "0°",
    "5°",
  ];

  final List<String> imageAddress = [
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
    "images/ic_home_inactive.png",
  ];

  ValueNotifier<CurrentWeatherResponseModel?>  currentWeatherResponseNotifier = ValueNotifier(null);

  void fetchCurrentWeather(String cityName) async {
    final response = await repository.getCurrentWeather(cityName);
    currentWeatherResponseNotifier.value = response;
  }

}
