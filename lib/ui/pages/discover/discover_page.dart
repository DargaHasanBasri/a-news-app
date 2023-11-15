import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../utils/custom_colors.dart';
import '../../widgets/custom_widgets/custom_text_form_field.dart';
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
      backgroundColor: CustomColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _customAppBar(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _customAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Stack(
        children: [
          Center(
            child: Text(
              "İÇERİK MAĞAZASI",
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "TR",
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
