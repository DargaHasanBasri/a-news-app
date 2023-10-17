import 'package:a_news_app/base/base_stateful_state.dart';
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
    listeners();
    //vm.fetchNosyCurrency("ceyrek-altin");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
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
                  padding: const EdgeInsets.symmetric(vertical: 26),
                  child: Text(
                    "A-News-App",
                    style: TextStyle(
                      color: CustomColors.black,
                      fontSize: 20,
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
                              ? "images/ic_home_active.png"
                              : vm.pageIndex.value == 2
                                  ? "images/ic_settings.png"
                                  : "images/ic_settings.png",
                      width: 30,
                      height: 30,
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
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: CustomColors.customBottomNavigationColor,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () => pageController.jumpToPage(0),
                          child: Ink(
                            child: Image.asset(
                              vm.pageIndex.value == 0 ? "images/ic_home_active.png" : "images/ic_home_inactive.png",
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: vm.pageIndex.value == 0 ? CustomColors.black : CustomColors.black.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () => pageController.jumpToPage(1),
                          child: Ink(
                            child: Image.asset(
                              vm.pageIndex.value == 1
                                  ? "images/ic_favorite_active.png"
                                  : "images/ic_favorite_inactive.png",
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        Text(
                          "Discover",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: vm.pageIndex.value == 1 ? CustomColors.black : CustomColors.black.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () => pageController.jumpToPage(2),
                          child: Ink(
                            child: Image.asset(
                              vm.pageIndex.value == 2
                                  ? "images/ic_favorite_active.png"
                                  : "images/ic_favorite_inactive.png",
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        Text(
                          "Favorite",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: vm.pageIndex.value == 2 ? CustomColors.black : CustomColors.black.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () => pageController.jumpToPage(3),
                          child: Ink(
                            child: Image.asset(
                              vm.pageIndex.value == 3
                                  ? "images/ic_profile_active.png"
                                  : "images/ic_profile_inactive.png",
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        Text(
                          "Search",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: vm.pageIndex.value == 3 ? CustomColors.black : CustomColors.black.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _customDrawer() {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                "images/ic_arrow_right.png",
                                color: CustomColors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Giriş Yap",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "images/ic_settings.png",
                        width: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Çeyrek Altın",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
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
                    ),
                    ValueListenableBuilder(
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
                                    vm.foreCastHourlyWeatherResponseNotifier.value?.location?.name?.toUpperCase() ??
                                        "-",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        vm.foreCastHourlyWeatherResponseNotifier.value?.current?.tempC
                                                ?.toInt()
                                                .toString() ??
                                            "-",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: CustomColors.black,
                                        ),
                                      ),
                                      Text(
                                        "°",
                                        style: TextStyle(
                                          fontSize: 16,
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
                        }),
                  ],
                ),
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
