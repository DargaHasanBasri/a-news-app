import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';
import 'login_view_model.dart';

class LoginProvider extends StatelessWidget {
  const LoginProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return LoginViewModel();
      },
      child: const LoginPage(),
    );
  }
}
