import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:a_news_app/ui/pages/weather/components/weekly_weather.dart';
import 'package:a_news_app/ui/pages/weather/weather_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import '../../../utils/custom_colors.dart';
import '../../../utils/extensions.dart';
import 'components/hourly_weather.dart';
import 'components/location_weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends BaseStatefulState<WeatherPage> {
  late final WeatherViewModel vm;
  late final ScrollController _weeklyScrollController;
  late final ScrollController _hourlyScrollController;
  late final ScrollController _pageScrollController;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<WeatherViewModel>(context, listen: false);
    initializeDateFormatting('tr_TR', null);
    _weeklyScrollController = ScrollController();
    _hourlyScrollController = ScrollController();
    _pageScrollController = ScrollController();
    listeners();
    showProgress(context);
    vm.fetchCurrentWeather("Samsun");
    vm.fetchForeCastHourlyWeather("Samsun", 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder(
              valueListenable: vm.currentWeatherResponseNotifier,
              builder: (_, __, ___) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: _buildAppBar(),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _pageScrollController,
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: LocationWeather(
                                location: 'Samsun',
                                degrees: vm.currentWeatherResponseNotifier.value?.current?.tempC.toString() ?? "-",
                              ),
                            ),
                            const SizedBox(height: 20),
                            ValueListenableBuilder(
                                valueListenable: vm.foreCastHourlyWeatherResponseNotifier,
                                builder: (_, __, ___) {
                                  return SizedBox(
                                    height: 100,
                                    child: ListView.separated(
                                      controller: _hourlyScrollController,
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: vm.foreCastHourlyWeatherResponseNotifier.value?.forecast?.forecastday?.first.hour?.length ??
                                          0,
                                      itemBuilder: (context, index) {
                                        return HourlyWeather(
                                          date: Extensions.getHourDate(vm.foreCastHourlyWeatherResponseNotifier.value?.forecast?.forecastday?.first.hour?[index].time),
                                          degrees: "${vm.foreCastHourlyWeatherResponseNotifier.value?.forecast?.forecastday?.first.hour?[index].tempC ?? "-"}",
                                          imageAddress: vm.imageAddress[index],
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(width: 10);
                                      },
                                    ),
                                  );
                                }),
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
                              controller: _weeklyScrollController,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: vm.foreCastHourlyWeatherResponseNotifier.value?.forecast?.forecastday?.length ?? 0,
                              itemBuilder: (context, index) {
                                return WeeklyWeather(
                                  day: Extensions.getDayDate(vm.foreCastHourlyWeatherResponseNotifier.value?.forecast?.forecastday?[index].date),
                                  degrees: "${vm.foreCastHourlyWeatherResponseNotifier.value?.forecast?.forecastday?[index].day?.maxtempC ?? "-"}",
                                  imageAddress: vm.imagesAddress2[index],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
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
    vm.foreCastHourlyWeatherResponseNotifier.addListener(() {
      hideProgress();
    });
  }
}
