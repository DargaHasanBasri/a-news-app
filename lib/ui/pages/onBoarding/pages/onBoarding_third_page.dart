import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:a_news_app/utils/route_helper.dart';
import 'package:flutter/material.dart';

import '../../../../utils/custom_colors.dart';
import '../../../widgets/custom_widgets/custom_button.dart';
import '../onBoarding_view_model.dart';

class OnBoardingThirdPage extends StatefulWidget {
  final OnBoardingViewModel vm;

  const OnBoardingThirdPage({
    super.key,
    required this.vm,
  });

  @override
  State<OnBoardingThirdPage> createState() => _OnBoardingThirdPageState();
}

class _OnBoardingThirdPageState extends BaseStatefulState<OnBoardingThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              "Onboarding Third Page",
              style: TextStyle(
                fontSize: 16,
                color: CustomColors.black,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: CustomButton(
              //onPress: () => navigationService.navigateTo(RouteHelper.bottomNavigation),
              backgroundColor: CustomColors.niceColor,
              title: "Login",
              titleFontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
