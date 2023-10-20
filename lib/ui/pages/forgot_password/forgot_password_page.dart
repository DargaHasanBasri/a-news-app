import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../utils/custom_colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
              S.current.forgotPassword,
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
