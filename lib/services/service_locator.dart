import 'dart:async';
import 'package:get_it/get_it.dart';
import 'navigation_service.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
}
