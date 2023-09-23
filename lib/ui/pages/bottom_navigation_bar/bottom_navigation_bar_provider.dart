import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation_bar_page.dart';
import 'bottom_navigation_bar_view_model.dart';

class BottomNavigationBarProvider extends StatelessWidget {
  const BottomNavigationBarProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return BottomNavigationBarViewModel();
      },
      child: const BottomNavigationBarPage(),
    );
  }
}
