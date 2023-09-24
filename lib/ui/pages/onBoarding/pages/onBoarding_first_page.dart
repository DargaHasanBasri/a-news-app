import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:flutter/material.dart';
import '../../../../utils/custom_colors.dart';
import '../onBoarding_view_model.dart';

class OnBoardingFirstPage extends StatefulWidget {
  final OnBoardingViewModel vm;

  const OnBoardingFirstPage({
    super.key,
    required this.vm,
  });

  @override
  State<OnBoardingFirstPage> createState() => _OnBoardingFirstPageState();
}

class _OnBoardingFirstPageState extends BaseStatefulState<OnBoardingFirstPage> {
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
              "Onboarding First Page",
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
