import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'settings_page.dart';
import 'settings_view_model.dart';



class SettingsProvider extends StatelessWidget {
  const SettingsProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return SettingsViewModel();
      },
      child: const SettingsPage(),
    );
  }
}
