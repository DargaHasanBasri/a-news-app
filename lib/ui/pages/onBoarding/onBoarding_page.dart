import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:a_news_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onBoarding_view_model.dart';
import 'pages/onBoarding_first_page.dart';
import 'pages/onBoarding_second_page.dart';
import 'pages/onBoarding_third_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends BaseStatefulState<OnBoardingPage> {
  late final OnBoardingViewModel vm;
  late final PageController _pageController = PageController();
  late final List<Widget> pages;
  @override
  void initState() {
    super.initState();
    vm = Provider.of<OnBoardingViewModel>(context, listen: false);
    pages = [
      OnBoardingFirstPage(vm: vm),
      OnBoardingSecondPage(vm: vm),
      OnBoardingThirdPage(vm: vm),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            "Onboarding Page",
            style: TextStyle(
              fontSize: 18,
              color: CustomColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: pages.length,
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {},
              itemBuilder: (BuildContext context, int index) {
                return pages[index];
              },
            ),
          ),
          Column(
            children: [
              Stack(
                fit: StackFit.loose,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: pages.length,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.yellow,
                          dotColor: Colors.black,
                          spacing: 10,
                          dotHeight: 8,
                          dotWidth: 14,
                          expansionFactor: 4,
                        ),
                        onDotClicked: (index) {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () => _pageController.jumpToPage(2),
                        child: Ink(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
