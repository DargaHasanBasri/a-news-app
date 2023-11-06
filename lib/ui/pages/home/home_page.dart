import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:a_news_app/ui/pages/bottom_navigation_bar/components/custom_categories.dart';
import 'package:a_news_app/ui/pages/home/components/news_item.dart';
import 'package:a_news_app/ui/pages/home/home_view_model.dart';
import 'package:a_news_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../generated/l10n.dart';
import '../../../models/enums/weather_enum.dart';
import '../../../utils/route_helper.dart';
import 'components/news_item_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseStatefulState<HomePage> {
  late final HomeViewModel vm;
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  late WeatherType _weatherType;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<HomeViewModel>(context, listen: false);
    _weatherType = WeatherType();
    //vm.fetchNosyCurrency("ceyrek-altin");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      backgroundColor: Colors.grey.withOpacity(0.1),
      drawer: _customDrawer(),
      body: ValueListenableBuilder(
        valueListenable: vm.isOpen,
        builder: (_,__,___) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _customAppBar(),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: vm.isOpen.value ? const NewsItem() : const NewsItemRow(),
                    );
                  },
                ),
              ),
            ],
          );
        }
      ),
    );
  }

  Widget _customAppBar() {
    return ValueListenableBuilder(
        valueListenable: vm.isOpen,
        builder: (_, __, ___) {
          return Container(
            decoration: BoxDecoration(
              color: CustomColors.backgroundHomeColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () {
                      _drawerKey.currentState!.openDrawer();
                      showProgress(context);
                      vm.fetchForeCastHourlyWeather("Samsun", 7);
                    },
                    child: Ink(
                      child: Image.asset(
                        "images/ic_menu.png",
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "TÜMÜ",
                    style: TextStyle(
                      color: CustomColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () => vm.isOpen.value = !vm.isOpen.value,
                    child: Image.asset(
                      vm.isOpen.value ? "images/ic_open_list.png" : "images/ic_close_list.png",
                      width: 26,
                      height: 26,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _customDrawer() {
    return Drawer(
      backgroundColor: CustomColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            "images/ic_arrow_right.png",
                            color: CustomColors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        S.current.login,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: CustomColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => navigationService.navigateTo(RouteHelper.settings),
                      child: Ink(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            "images/ic_settings.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _currencyValue(),
                _locationWeather(),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: vm.categoriesTitle.length,
              itemBuilder: (context, index) {
                return CustomCategories(
                  title: vm.categoriesTitle[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _currencyValue() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.quarterGold,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: CustomColors.black,
            ),
          ),
          const SizedBox(height: 10),
          ValueListenableBuilder(
              valueListenable: vm.currencyNosyResponseNotifier,
              builder: (_, __, ___) {
                return Row(
                  children: [
                    (vm.currencyNosyResponseNotifier.value?.data?.first.changeRate ?? 0) > 0
                        ? Image.asset(
                            "images/ic_caret_arrow.png",
                            width: 20,
                          )
                        : RotatedBox(
                            quarterTurns: 2,
                            child: Image.asset(
                              "images/ic_caret_arrow.png",
                              width: 20,
                              color: Colors.red,
                            ),
                          ),
                    const SizedBox(width: 10),
                    Text(
                      "${vm.currencyNosyResponseNotifier.value?.data?.first.selling}" ?? "-",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.black,
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }

  Widget _locationWeather() {
    return ValueListenableBuilder(
        valueListenable: vm.foreCastHourlyWeatherResponseNotifier,
        builder: (_, __, ___) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => navigationService.navigateTo(
                RouteHelper.weather,
                arguments: vm.foreCastHourlyWeatherResponseNotifier.value,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vm.foreCastHourlyWeatherResponseNotifier.value?.location?.name?.toUpperCase() ?? "-",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        _weatherType.getIconAddress(
                            _weatherType
                                .getEnumType(vm.foreCastHourlyWeatherResponseNotifier.value?.current?.condition?.text),
                            vm.foreCastHourlyWeatherResponseNotifier.value?.location?.localtime),
                        height: 26,
                        width: 26,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        vm.foreCastHourlyWeatherResponseNotifier.value?.current?.tempC?.toInt().toString() ?? "-",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: CustomColors.black,
                        ),
                      ),
                      Text(
                        "°",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: CustomColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  listeners() {
    vm.currencyNosyResponseNotifier.addListener(() {
      /*
      if (vm.currencyNosyResponseNotifier.value != null) {
        //hideProgress();
      }
       */
    });
    vm.foreCastHourlyWeatherResponseNotifier.addListener(() {
      hideProgress();
    });
  }
}
