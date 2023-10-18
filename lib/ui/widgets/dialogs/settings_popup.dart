import 'package:a_news_app/ui/widgets/custom_widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';

import '../../../base/base_stateful_state.dart';
import '../../../utils/custom_colors.dart';

class SettingsPopup extends StatefulWidget {
  const SettingsPopup({super.key});

  @override
  State<SettingsPopup> createState() => _SettingsPopupState();
}

class _SettingsPopupState extends BaseStatefulState<SettingsPopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Dili Değiştir",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: CustomColors.black,
              ),
            ),
            const SizedBox(height: 20),
            CustomRadioButton(
              isSelected: true,
              title: "English",
              onSelected: () {},
            ),
            const SizedBox(height: 20),
            CustomRadioButton(
              isSelected: true,
              title: "Türkçe",
              onSelected: () {},
            ),
            const SizedBox(height: 20),
            CustomRadioButton(
              isSelected: true,
              title: "Deutsch",
              onSelected: () {},
            ),
            const SizedBox(height: 20),
            CustomRadioButton(
              isSelected: true,
              title: "Français",
              onSelected: () {},
            ),
            const SizedBox(height: 20),
            CustomRadioButton(
              isSelected: true,
              title: "Espanol",
              onSelected: () {},
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
