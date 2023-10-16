import 'dart:convert';

import 'package:a_news_app/base/api_base.dart';
import 'package:a_news_app/base/base_url.dart';
import 'package:http/http.dart';

import '../models/response/current_weather_response_model.dart';
import '../models/response/fore_cast_response_model.dart';
import '../models/response/genel_para_api_currency_response_model.dart';
import '../models/response/nosy_api_currency_response_model.dart';
import '../services/service_locator.dart';
import '../utils/constants.dart';

class Repository {
  final ApiBase _helper = locator<ApiBase>();
  BaseUrl url = BaseUrl();

  Future<GenelApiCurrencyResponseModel?> getCurrency() async {
    final Response response = await _helper.get(url.genelApiCurrencyURL, "");
    return Future.value(GenelApiCurrencyResponseModel.fromJson(json.decode(response.body)));
  }

  Future<NosyApiCurrencyResponseModel?> getNosyCurrency(String whichCurrency) async {
    final Response response = await _helper.get("${url.nosyApiCurrencyURL}$whichCurrency", Constants.NOSY_API_KEY);
    return Future.value(NosyApiCurrencyResponseModel.fromJson(json.decode(response.body)));
  }

  Future<CurrentWeatherResponseModel?> getCurrentWeather(String cityName) async {
    var path = "${url.weatherApiCurrentURL}/current.json?q=";
    final Response response = await _helper.get("$path$cityName", Constants.WEATHER_API_KEY);
    return Future.value(CurrentWeatherResponseModel.fromJson(json.decode(response.body)));
  }

  Future<ForeCastResponseModel?> getForeCastHourlyWeather(String? cityName, int? howDay) async {
    final Response response = await _helper.get("${url.weatherApiCurrentURL}/forecast.json?q=$cityName&days=$howDay", Constants.WEATHER_API_KEY);
    return Future.value(ForeCastResponseModel.fromJson(json.decode(response.body)));
  }

}