import 'package:flutter/material.dart';

import '../services/navigation_service.dart';
import '../services/service_locator.dart';

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  final NavigationService navigationService = locator<NavigationService>();

}