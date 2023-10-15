import 'dart:convert';

import 'package:a_news_app/base/api_base.dart';
import 'package:a_news_app/base/base_url.dart';
import 'package:http/http.dart';

import '../models/response/currency_response_model.dart';
import '../services/service_locator.dart';

class Repository {
  final ApiBase _helper = locator<ApiBase>();
  BaseUrl url = BaseUrl();

  Future<CurrencyResponseModel?> getCurrency() async {
    final Response response = await _helper.get(url.currencyURL);
    return Future.value(CurrencyResponseModel.fromJson(json.decode(response.body)));
  }

}