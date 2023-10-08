import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'splash_page.dart';
import 'splash_view_model.dart';

class SplashProvider extends StatelessWidget {
  const SplashProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) {
          return SplashViewModel();
        },
      child: const SplashPage(),
    );
  }
}

