import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'forgot_password_page.dart';
import 'forgot_password_view_model.dart';

class ForgotPasswordProvider extends StatelessWidget {
  const ForgotPasswordProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ForgotPasswordViewModel();
      },
      child: const ForgotPasswordPage(),
    );
  }
}
