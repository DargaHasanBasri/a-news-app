import 'package:flutter/cupertino.dart';

import '../utils/route_helper.dart';

class NavigationService {
  final GlobalKey<NavigatorState> baseNavigatorKey =
  GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName,
      {dynamic key, dynamic arguments, Function? callback}) {
    GlobalKey<NavigatorState> theKey;
    if (key != null) {
      theKey = key;
    } else {
      theKey = baseNavigatorKey;
    }
    return theKey.currentState!
        .pushNamed(routeName, arguments: arguments)
        .then((x) {
      if (callback != null) {
        callback(x);
      }
    });
  }

  Future<dynamic> navigateToReplacement(String routeName,
      {dynamic key, dynamic arguments, Function? callback}) {
    GlobalKey<NavigatorState> theKey;
    if (key != null) {
      theKey = key;
    } else {
      theKey = baseNavigatorKey;
    }
    return theKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments)
        .then((x) {
      if (callback != null) {
        callback(x);
      }
    });
  }

  Future<dynamic> navigateRemoveUntil(String routeName,
      {dynamic key, dynamic arguments, Function? callback}) {
    GlobalKey<NavigatorState> theKey;
    if (key != null) {
      theKey = key;
    } else {
      theKey = baseNavigatorKey;
    }
    return theKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false,
        arguments: arguments)
        .then((x) {
      if (callback != null) {
        callback(x);
      }
    });
  }

  Future<dynamic> popPages(int pageNumber, {dynamic key, dynamic arguments}) {
    GlobalKey<NavigatorState> theKey;
    if (key != null) {
      theKey = key;
    } else {
      theKey = baseNavigatorKey;
    }
    for (int i = 0; i < pageNumber; i++) {
      if (theKey.currentState!.canPop()) {
        theKey.currentState!.pop(arguments);
      } else {
        navigateRemoveUntil(RouteHelper.home, arguments: arguments); //TODO splash eklenince değiştir
        break;
      }
    }
    return Future.value(arguments);
  }

  Future<dynamic> popIfBackStackNotEmpty({dynamic key, dynamic arguments}) {
    GlobalKey<NavigatorState> theKey;
    if (key != null) {
      theKey = key;
    } else {
      theKey = baseNavigatorKey;
    }
    if (theKey.currentState!.canPop()) {
      theKey.currentState!.pop(arguments);
    } else {
      navigateRemoveUntil(RouteHelper.home, arguments: arguments); //TODO splash eklenince değiştir
    }
    return Future.value(arguments);
  }
}
