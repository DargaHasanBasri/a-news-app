import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'weather_page.dart';
import 'weather_view_model.dart';

class WeatherProvider extends StatelessWidget {
  const WeatherProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherViewModel();
      },
      child: const WeatherPage(),
    );
  }
}
