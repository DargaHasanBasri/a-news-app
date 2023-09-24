import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'onBoarding_page.dart';
import 'onBoarding_view_model.dart';

class OnBoardingProvider extends StatelessWidget {
  const OnBoardingProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return OnBoardingViewModel();
      },
      child: const OnBoardingPage(),
    );
  }
}
