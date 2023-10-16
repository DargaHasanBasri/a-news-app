import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:a_news_app/ui/pages/weather/components/weekly_weather.dart';
import 'package:a_news_app/ui/pages/weather/weather_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/custom_colors.dart';
import 'components/hourly_weather.dart';
import 'components/location_weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends BaseStatefulState<WeatherPage> {
  late final WeatherViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<WeatherViewModel>(context, listen: false);
    listeners();
    vm.fetchCurrentWeather("Samsun");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: _buildAppBar(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: LocationWeather(
                          location: 'Samsun',
                          degrees: "21°",
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: vm.date.length,
                          itemBuilder: (context, index) {
                            return HourlyWeather(
                              date: vm.date[index],
                              degrees: vm.degrees[index],
                              imageAddress: vm.imageAddress[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 10);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "HAFTALIK GÖRÜNÜM",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: CustomColors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: vm.day.length,
                        itemBuilder: (context, index) {
                          return WeeklyWeather(
                            day: vm.day[index],
                            degrees: vm.degrees[index],
                            imageAddress: vm.imageAddress[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.arrow_back_ios,
          color: CustomColors.black,
          size: 20,
        ),
        Image.asset(
          "images/ic_settings.png",
          width: 20,
        ),
      ],
    );
  }

  listeners() {
    vm.currentWeatherResponseNotifier.addListener(() {

    });
  }
}
