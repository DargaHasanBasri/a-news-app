import 'package:a_news_app/base/base_stateful_state.dart';
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

  final List<Widget> pages = [
    const HomeProvider(),
    const DiscoverProvider(),
    const NotificationsProvider(),
    const SearchProvider(),
  ];

  @override
  void initState() {
    super.initState();
    vm = Provider.of<BottomNavigationBarViewModel>(context, listen: false);
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ValueListenableBuilder(
          valueListenable: vm.pageIndex,
          builder: (_, __, ___) {
            return PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: pages,
              onPageChanged: (value) {
                vm.pageIndex.value = value;
                FocusScope.of(context).requestFocus(FocusNode());
              },
            );
          }),
      bottomNavigationBar: _customBottomNavigationBar(),
    );
  }

  Widget _customBottomNavigationBar() {
    return ValueListenableBuilder(
        valueListenable: vm.pageIndex,
        builder: (_, __, ___) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                color: CustomColors.customBottomNavigationColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => pageController.jumpToPage(0),
                      child: Ink(
                        child: Image.asset(
                          "images/ic_home.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => pageController.jumpToPage(1),
                      child: Ink(
                        child: Image.asset(
                          "images/ic_home.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => pageController.jumpToPage(2),
                      child: Ink(
                        child: Image.asset(
                          "images/ic_home.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => pageController.jumpToPage(3),
                      child: Ink(
                        child: Image.asset(
                          "images/ic_home.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
