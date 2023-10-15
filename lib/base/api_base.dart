import 'dart:io';

import 'package:a_news_app/base/api_exception.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiBase {
  Future<http.Response> get(String url) async {
    http.Response apiResponse;
    debugPrint('API GET REQUEST -----> URL : $url\nREQUEST');
    try {
      apiResponse = await http.get(Uri.parse(url));
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
