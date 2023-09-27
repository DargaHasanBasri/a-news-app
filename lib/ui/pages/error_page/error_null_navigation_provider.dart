import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'error_null_navigation_page.dart';
import 'error_null_navigation_view_model.dart';

class ErrorNullNavigationProvider extends StatelessWidget {
  const ErrorNullNavigationProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ErrorNullNavigationViewModel();
      },
      child: const ErrorNullNavigationPage(),
    );
  }
}
