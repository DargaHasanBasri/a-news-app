import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/response/fore_cast_response_model.dart';
import 'weather_page.dart';
import 'weather_view_model.dart';

class WeatherProvider extends StatelessWidget {
  final ForeCastResponseModel? foreCastModel;
  const WeatherProvider(
    this.foreCastModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherViewModel(foreCastModel);
      },
      child: const WeatherPage(),
    );
  }
}
