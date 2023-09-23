import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation_bar_view_model.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarPage> createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends BaseStatefulState<BottomNavigationBarPage> {
  late final BottomNavigationBarViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<BottomNavigationBarViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _customBottomNavigationBar(),
    );
  }

  Widget _customBottomNavigationBar() {
    return Container();
  }
}
