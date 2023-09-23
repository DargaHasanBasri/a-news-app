import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'search_page.dart';
import 'search_view_model.dart';

class SearchProvider extends StatelessWidget {
  const SearchProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return SearchViewModel();
      },
      child: const SearchPage(),
    );
  }
}
