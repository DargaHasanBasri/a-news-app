import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../base/base_stateful_state.dart';
import '../../../utils/custom_colors.dart';
import 'search_view_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends BaseStatefulState<SearchPage> {
  late final SearchViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<SearchViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        color: CustomColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Search",
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
