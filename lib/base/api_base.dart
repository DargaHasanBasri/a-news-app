import 'dart:io';

import 'package:a_news_app/base/api_exception.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class ApiBase {
  Future<Map<String, String>> getHeader(String? apiKey) async {
    if (apiKey == Constants.NOSY_API_KEY) {
      return {
        "Authorization": "Bearer $apiKey",
      };
    } else if (apiKey == Constants.WEATHER_API_KEY) {
      return {
        "key": "$apiKey",
      };
    } else {
      return {};
    }
  }

  Future<http.Response> get(String url, String? apiKey) async {
    http.Response apiResponse;
    var header = await getHeader(apiKey);
    debugPrint('API GET REQUEST -----> URL : $url\nREQUEST HEADER : $header');
    try {
      apiResponse = await http.get(Uri.parse(url), headers: header);
    } on SocketException {
      debugPrint('NO NETWORK');
      throw FetchDataException('No Internet connection');
    }
    debugPrint("<----- API GET RESPONSE  URL : $url\n${apiResponse.body}");
    return apiResponse;
  }

  Future<dynamic> post(String url, dynamic body) async {
    debugPrint('API POST REQUEST -----> URL : $url\nREQUEST BODY : $body');
    http.Response apiResponse;
    try {
      apiResponse = await http.post(Uri.parse(url), body: body);
    } on SocketException {
      debugPrint('NO NETWORK');
      throw FetchDataException('No Internet connection');
    }
    debugPrint("<----- API POST RESPONSE  URL : $url\n${apiResponse.body}");
    return apiResponse;
  }
}
