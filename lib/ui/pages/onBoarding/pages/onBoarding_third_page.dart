import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:flutter/material.dart';

import '../../../../utils/custom_colors.dart';
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
      body: Container(
        width: double.maxFinite,
        color: CustomColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Onboarding Third Page",
              style: TextStyle(
                fontSize: 16,
                color: CustomColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
