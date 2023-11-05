import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:a_news_app/ui/pages/weather/components/weekly_weather.dart';
import 'package:a_news_app/ui/pages/weather/weather_view_model.dart';
import 'package:a_news_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../models/enums/weather_enum.dart';
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
  late final WeatherType _weatherType;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<WeatherViewModel>(context, listen: false);
    initializeDateFormatting('tr_TR', null);
    _weeklyScrollController = ScrollController();
    _hourlyScrollController = ScrollController();
    _pageScrollController = ScrollController();
    _weatherType = WeatherType();
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundWeatherColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                controller: _pageScrollController,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Center(
                        child: LocationWeather(
                          location: vm.foreCastModel?.location?.name?.toUpperCase() ?? "-",
                          degrees: vm.foreCastModel?.current?.tempC?.toInt().toString() ?? "-",
                          imageAddress: _weatherType.getIconAddress(
                            _weatherType.getEnumType(vm.foreCastModel?.current?.condition?.text),
                            vm.foreCastModel?.location?.localtime,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 110,
                        child: ListView.separated(
                          controller: _hourlyScrollController,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: vm.foreCastModel?.forecast?.forecastday?.first.hour?.length ?? 0,
                          itemBuilder: (context, index) {
                            return HourlyWeather(
                              date: Extensions.getHourDate(
                                  vm.foreCastModel?.forecast?.forecastday?.first.hour?[index].time),
                              degrees:
                                  "${vm.foreCastModel?.forecast?.forecastday?.first.hour?[index].tempC?.toInt() ?? "-"}",
                              imageAddress: _weatherType.getIconAddress(
                                _weatherType.getEnumType(
                                    vm.foreCastModel?.forecast?.forecastday?.first.hour?[index].condition?.text),
                                vm.foreCastModel?.forecast?.forecastday?.first.hour?[index].time,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 10);
                          },
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text(
                        S.current.weeklyView,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).textTheme.titleMedium?.color,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        controller: _weeklyScrollController,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: vm.foreCastModel?.forecast?.forecastday?.length ?? 0,
                        itemBuilder: (context, index) {
                          return WeeklyWeather(
                            day: Extensions.getDayDate(vm.foreCastModel?.forecast?.forecastday?[index].date),
                            degrees: "${vm.foreCastModel?.forecast?.forecastday?[index].day?.maxtempC?.toInt() ?? "-"}",
                            imageAddress: _weatherType.getIconAddress(
                              _weatherType
                                  .getEnumType(vm.foreCastModel?.forecast?.forecastday?[index].day?.condition?.text),
                              "",
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      color: CustomColors.backgroundWeatherColor,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => navigationService.popIfBackStackNotEmpty(),
                  child: Ink(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        "images/ic_arrow_back.png",
                        height: 20,
                        width: 20,
                        color: Theme.of(context).textTheme.titleMedium?.color,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Ink(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        "images/ic_settings.png",
                        width: 20,
                        height: 20,
                        color: Theme.of(context).textTheme.titleMedium?.color,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  listeners() {}
}
