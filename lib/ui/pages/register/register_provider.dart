import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'register_page.dart';
import 'register_view_model.dart';

class RegisterProvider extends StatelessWidget {
  const RegisterProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return RegisterViewModel();
      },
      child: const RegisterPage(),
    );
  }
}
