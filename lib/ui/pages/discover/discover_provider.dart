import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'discover_page.dart';
import 'discover_view_model.dart';

class DiscoverProvider extends StatelessWidget {
  const DiscoverProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return DiscoverViewModel();
      },
      child: const DiscoverPage(),
    );
  }
}
