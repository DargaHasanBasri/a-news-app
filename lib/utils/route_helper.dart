import 'package:a_news_app/ui/pages/splash/splash_provider.dart';
import 'package:flutter/material.dart';

import '../models/response/fore_cast_response_model.dart';
import '../ui/pages/bottom_navigation_bar/bottom_navigation_bar_provider.dart';
import '../ui/pages/discover/discover_provider.dart';
import '../ui/pages/error_page/error_null_navigation_provider.dart';
import '../ui/pages/forgot_password/forgot_password_provider.dart';
import '../ui/pages/home/home_provider.dart';
import '../ui/pages/login/login_provider.dart';
import '../ui/pages/notifications/notifications_provider.dart';
import '../ui/pages/onBoarding/onBoarding_provider.dart';
import '../ui/pages/register/register_provider.dart';
import '../ui/pages/search/search_provider.dart';
import '../ui/pages/weather/weather_provider.dart';

class RouteHelper {
  static const String splash = 'SplashProvider';
  static const String home = 'HomeProvider';
  static const String onBoarding = 'OnBoardingProvider';
  static const String login = 'LoginProvider';
  static const String register = 'registerProvider';
  static const String forgotPassword = 'ForgotPasswordProvider';
  static const String search = 'SearchProvider';
  static const String notifications = 'NotificationsProvider';
  static const String discover = 'DiscoverProvider';
  static const String bottomNavigation = 'BottomNavigationBarProvider';
  static const String errorNullNavigation = 'ErrorNullNavigationProvider';
  static const String weather = 'WeatherProvider';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteHelper.splash:
        return MaterialPageRoute(builder: (context) => const SplashProvider());
      case RouteHelper.home:
        return MaterialPageRoute(builder: (context) => const HomeProvider());
      case RouteHelper.onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingProvider());
      case RouteHelper.login:
        return MaterialPageRoute(builder: (context) => const LoginProvider());
      case RouteHelper.register:
        return MaterialPageRoute(builder: (context) => const RegisterProvider());
      case RouteHelper.forgotPassword:
        return MaterialPageRoute(builder: (context) => const ForgotPasswordProvider());
      case RouteHelper.search:
        return MaterialPageRoute(builder: (context) => const SearchProvider());
      case RouteHelper.notifications:
        return MaterialPageRoute(builder: (context) => const NotificationsProvider());
      case RouteHelper.discover:
        return MaterialPageRoute(builder: (context) => const DiscoverProvider());
      case RouteHelper.bottomNavigation:
        return MaterialPageRoute(builder: (context) => const BottomNavigationBarProvider());
      case RouteHelper.errorNullNavigation:
        return MaterialPageRoute(builder: (context) => const ErrorNullNavigationProvider());
        case RouteHelper.weather:
          ForeCastResponseModel foreCastModel = settings.arguments as ForeCastResponseModel;
        return MaterialPageRoute(builder: (context) => WeatherProvider(foreCastModel));
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No path for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
