import 'package:a_news_app/ui/widgets/custom_widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';

import '../../../base/base_stateful_state.dart';
import '../../../utils/custom_colors.dart';

class SettingsLanguagePopup extends StatefulWidget {
  const SettingsLanguagePopup({super.key});

  @override
  State<SettingsLanguagePopup> createState() => _SettingsLanguagePopupState();
}

List<String> radioItem = ["English", "Türkçe", "Deutsch", "Français", "Espanol"];
ValueNotifier<String> isSelect = ValueNotifier("Türkçe");

class _SettingsLanguagePopupState extends BaseStatefulState<SettingsLanguagePopup> {
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
            ValueListenableBuilder(
                valueListenable: isSelect,
                builder: (_, __, ___) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...radioItem
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: CustomRadioButton(
                                title: item,
                                isSelected: isSelect.value == item,
                                onSelected: () {
                                  isSelect.value = item;
                                },
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  );
                }),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  const Text(""),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => navigationService.popIfBackStackNotEmpty(),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "İPTAL",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
