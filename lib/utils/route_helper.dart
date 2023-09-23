import 'package:a_news_app/ui/pages/discover/discover_provider.dart';
import 'package:flutter/material.dart';

import '../ui/pages/bottom_navigation_bar/bottom_navigation_bar_provider.dart';
import '../ui/pages/home/home_provider.dart';
import '../ui/pages/notifications/notifications_provider.dart';
import '../ui/pages/search/search_provider.dart';

class RouteHelper {
  static const String home = 'HomeProvider';
  static const String search = 'SearchProvider';
  static const String notifications = 'NotificationsProvider';
  static const String discover = 'DiscoverProvider';
  static const String bottomNavigation = 'BottomNavigationBarProvider';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteHelper.home:
        return MaterialPageRoute(builder: (context) => const HomeProvider());
      case RouteHelper.search:
        return MaterialPageRoute(builder: (context) => const SearchProvider());
      case RouteHelper.notifications:
        return MaterialPageRoute(builder: (context) => const NotificationsProvider());
      case RouteHelper.discover:
        return MaterialPageRoute(builder: (context) => const DiscoverProvider());
      case RouteHelper.bottomNavigation:
        return MaterialPageRoute(builder: (context) => const BottomNavigationBarProvider());
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
