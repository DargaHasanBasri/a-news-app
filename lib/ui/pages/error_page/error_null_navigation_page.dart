import 'package:flutter/material.dart';

class ErrorNullNavigationPage extends StatefulWidget {
  const ErrorNullNavigationPage({Key? key}) : super(key: key);

  @override
  State<ErrorNullNavigationPage> createState() => _ErrorNullNavigationPageState();
}

class _ErrorNullNavigationPageState extends State<ErrorNullNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          "ERROR NULL NAVIGATION",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
