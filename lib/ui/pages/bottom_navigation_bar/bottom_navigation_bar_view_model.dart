import 'package:a_news_app/base/base_view_model.dart';
import 'package:flutter/foundation.dart';

import '../../../models/response/fore_cast_response_model.dart';
import '../../../models/response/genel_para_api_currency_response_model.dart';
import '../../../models/response/nosy_api_currency_response_model.dart';

class BottomNavigationBarViewModel extends BaseViewModel {
  ValueNotifier<int> pageIndex = ValueNotifier(0);
  ValueNotifier<bool> isOpen = ValueNotifier(false);
  ValueNotifier<GenelApiCurrencyResponseModel?> currencyResponseNotifier = ValueNotifier(null);
  ValueNotifier<NosyApiCurrencyResponseModel?> currencyNosyResponseNotifier = ValueNotifier(null);
  ValueNotifier<ForeCastResponseModel?> foreCastHourlyWeatherResponseNotifier = ValueNotifier(null);

  void fetchCurrency() async {
    final response = await repository.getCurrency();
    currencyResponseNotifier.value = response;
  }
  void fetchNosyCurrency(String whichCurrency) async {
    final response = await repository.getNosyCurrency(whichCurrency);
    currencyNosyResponseNotifier.value = response;
  }

  void fetchForeCastHourlyWeather(String? cityName, int? howDay) async {
    final response = await repository.getForeCastHourlyWeather(cityName, howDay);
    foreCastHourlyWeatherResponseNotifier.value = response;
  }

  List<String> categoriesTitle = [
    "Tümü",
    "Konular",
    "Gündem",
    "Bilim",
    "Yazılım",
    "Kültür & Sanat",
    "Gezi",
    "Spor",
    "Eğlence",
    "Sağlık",
    "Teknoloji",
    "Yaşam",
  ];
}
