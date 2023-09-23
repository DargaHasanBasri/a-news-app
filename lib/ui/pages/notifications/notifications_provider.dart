import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifications_page.dart';
import 'notifications_view_model.dart';

class NotificationsProvider extends StatelessWidget {
  const NotificationsProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return NotificationsViewModel();
      },
      child: const NotificationsPage(),
    );
  }
}
