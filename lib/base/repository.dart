import 'dart:convert';

import 'package:a_news_app/base/api_base.dart';
import 'package:a_news_app/base/base_url.dart';
import 'package:http/http.dart';

import '../models/response/genel_para_api_currency_response_model.dart';
import '../models/response/nosy_api_currency_response_model.dart';
import '../services/service_locator.dart';

class Repository {
  final ApiBase _helper = locator<ApiBase>();
  BaseUrl url = BaseUrl();

  Future<GenelApiCurrencyResponseModel?> getCurrency() async {
    final Response response = await _helper.get(url.genelApiCurrencyURL, false);
    return Future.value(GenelApiCurrencyResponseModel.fromJson(json.decode(response.body)));
  }

  Future<NosyApiCurrencyResponseModel?> getNosyCurrency(String whichCurrency) async {
    final Response response = await _helper.get("${url.nosyApiCurrencyURL}$whichCurrency", true);
    return Future.value(NosyApiCurrencyResponseModel.fromJson(json.decode(response.body)));
  }

}