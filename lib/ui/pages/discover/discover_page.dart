import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'discover_view_model.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends BaseStatefulState<DiscoverPage> {
  late final DiscoverViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<DiscoverViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
      ),
    );
  }
}
