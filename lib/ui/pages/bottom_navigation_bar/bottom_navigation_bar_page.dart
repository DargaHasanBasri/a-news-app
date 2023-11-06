import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:a_news_app/generated/l10n.dart';
import 'package:a_news_app/models/enums/icon_bottom_nav_enum.dart';
import 'package:a_news_app/models/enums/weather_enum.dart';
import 'package:a_news_app/ui/pages/discover/discover_provider.dart';
import 'package:a_news_app/ui/pages/home/home_provider.dart';
import 'package:a_news_app/ui/pages/notifications/notifications_provider.dart';
import 'package:a_news_app/ui/pages/search/search_provider.dart';
import 'package:a_news_app/utils/custom_colors.dart';
import 'package:a_news_app/utils/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation_bar_view_model.dart';
import 'components/custom_categories.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarPage> createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends BaseStatefulState<BottomNavigationBarPage> {
  late final BottomNavigationBarViewModel vm;
  late PageController pageController;
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  late WeatherType _weatherType;
  late IconBottomNavEnum _iconBottomNavEnum;

  final List<Widget> pages = [
    const HomeProvider(),
    const NotificationsProvider(),
    const DiscoverProvider(),
    const SearchProvider(),
  ];

  @override
  void initState() {
    super.initState();
    vm = Provider.of<BottomNavigationBarViewModel>(context, listen: false);
    pageController = PageController(initialPage: 0);
    _weatherType = WeatherType();
    _iconBottomNavEnum = IconBottomNavEnum();
    //vm.fetchNosyCurrency("ceyrek-altin");
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundHomeColor,
      extendBody: true,
      key: _drawerKey,
      drawer: _customDrawer(),
      body: SafeArea(
        bottom: false,
        child: ValueListenableBuilder(
            valueListenable: vm.pageIndex,
            builder: (_, __, ___) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ValueListenableBuilder(
                      valueListenable: vm.isOpen,
                      builder: (_, __, ___) {
                        return _customAppBar();
                      }),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      children: pages,
                      onPageChanged: (value) {
                        vm.pageIndex.value = value;
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                  ),
                ],
              );
            }),
      ),
      bottomNavigationBar: _customBottomNavigationBar(),
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
                    onTap: () => vm.pageIndex.value == 0
                        ? (vm.isOpen.value = !vm.isOpen.value)
                        : vm.isOpen.value = vm.isOpen.value,
                    child: Image.asset(
                      vm.pageIndex.value == 0
                          ? (vm.isOpen.value ? "images/ic_open_list.png" : "images/ic_close_list.png")
                          : vm.pageIndex.value == 1
                              ? "images/ic_active_home.png"
                              : vm.pageIndex.value == 2
                                  ? "images/ic_settings.png"
                                  : "images/ic_settings.png",
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

  Widget _customBottomNavigationBar() {
    return ValueListenableBuilder(
        valueListenable: vm.pageIndex,
        builder: (_, __, ___) {
          return Container(
            decoration: BoxDecoration(
              color: CustomColors.customBottomNavigationColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () => pageController.jumpToPage(0),
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(
                          vm.pageIndex.value == 0
                              ? _iconBottomNavEnum.getBottomNavIconAddress(IconTypeEnum.IC_ACTIVE_HOME)
                              : _iconBottomNavEnum.getBottomNavIconAddress(IconTypeEnum.IC_INACTIVE_HOME),
                          color: vm.pageIndex.value == 0 ? CustomColors.white : CustomColors.bottomNavBarIconColor,
                          width: 26,
                          height: 26,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => pageController.jumpToPage(1),
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(
                          vm.pageIndex.value == 1
                              ? _iconBottomNavEnum.getBottomNavIconAddress(IconTypeEnum.IC_ACTIVE_DISCOVER)
                              : _iconBottomNavEnum.getBottomNavIconAddress(IconTypeEnum.IC_INACTIVE_DISCOVER),
                          color: vm.pageIndex.value == 1 ? CustomColors.white : CustomColors.bottomNavBarIconColor,
                          width: 26,
                          height: 26,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => pageController.jumpToPage(2),
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(
                          vm.pageIndex.value == 2
                              ? _iconBottomNavEnum.getBottomNavIconAddress(IconTypeEnum.IC_ACTIVE_SEARCH)
                              : _iconBottomNavEnum.getBottomNavIconAddress(IconTypeEnum.IC_INACTIVE_SEARCH),
                          color: vm.pageIndex.value == 2 ? CustomColors.white : CustomColors.bottomNavBarIconColor,
                          width: 26,
                          height: 26,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => pageController.jumpToPage(3),
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image.asset(
                          vm.pageIndex.value == 3
                              ? _iconBottomNavEnum.getBottomNavIconAddress(IconTypeEnum.IC_ACTIVE_NOTIFICATIONS)
                              : _iconBottomNavEnum.getBottomNavIconAddress(IconTypeEnum.IC_INACTIVE_NOTIFICATIONS),
                          color: vm.pageIndex.value == 3 ? CustomColors.white : CustomColors.bottomNavBarIconColor,
                          width: 26,
                          height: 26,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
