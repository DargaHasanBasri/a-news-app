import 'dart:async';
import 'package:a_news_app/base/api_base.dart';
import 'package:a_news_app/base/repository.dart';
import 'package:get_it/get_it.dart';
import 'navigation_service.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Repository());
  locator.registerLazySingleton(() => ApiBase());
}
