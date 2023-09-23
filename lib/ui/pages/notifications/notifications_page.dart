import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifications_view_model.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends BaseStatefulState<NotificationsPage> {
  late final NotificationsViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<NotificationsViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}
