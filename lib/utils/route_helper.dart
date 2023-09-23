import 'package:flutter/material.dart';

import '../ui/pages/home/home_provider.dart';

class RouteHelper {
  static const String home = 'HomProvider';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteHelper.home:
        return MaterialPageRoute(builder: (context) => const HomeProvider());
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
