import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:flutter/material.dart';

import '../../../../utils/custom_colors.dart';
import '../onBoarding_view_model.dart';

class OnBoardingSecondPage extends StatefulWidget {
  final OnBoardingViewModel vm;

  const OnBoardingSecondPage({
    super.key,
    required this.vm,
  });

  @override
  State<OnBoardingSecondPage> createState() => _OnBoardingSecondPageState();
}

class _OnBoardingSecondPageState extends BaseStatefulState<OnBoardingSecondPage> {
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
              "Onboarding Second Page",
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
