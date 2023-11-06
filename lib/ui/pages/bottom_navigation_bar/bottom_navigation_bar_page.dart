import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:a_news_app/models/enums/icon_bottom_nav_enum.dart';
import 'package:a_news_app/models/enums/weather_enum.dart';
import 'package:a_news_app/ui/pages/discover/discover_provider.dart';
import 'package:a_news_app/ui/pages/home/home_provider.dart';
import 'package:a_news_app/ui/pages/notifications/notifications_provider.dart';
import 'package:a_news_app/ui/pages/search/search_provider.dart';
import 'package:a_news_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation_bar_view_model.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarPage> createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends BaseStatefulState<BottomNavigationBarPage> {
  late final BottomNavigationBarViewModel vm;
  late PageController pageController;
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
    _iconBottomNavEnum = IconBottomNavEnum();
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundHomeColor,
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: ValueListenableBuilder(
            valueListenable: vm.pageIndex,
            builder: (_, __, ___) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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




  listeners() {
  }
}
