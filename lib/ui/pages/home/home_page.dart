import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:flutter/material.dart';

import '../../../utils/custom_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseStatefulState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 100,
        itemBuilder: (context, index) {
          return Center(
            child: Text(
              "Home",
              style: TextStyle(
                fontSize: 16,
                color: CustomColors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
