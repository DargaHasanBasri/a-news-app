import 'package:a_news_app/ui/widgets/custom_widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';

import '../../../base/base_stateful_state.dart';
import '../../../utils/custom_colors.dart';

class SettingsContentLetterSizePopup extends StatefulWidget {
  const SettingsContentLetterSizePopup({super.key});

  @override
  State<SettingsContentLetterSizePopup> createState() => _SettingsContentLetterSizePopupState();
}

List<String> radioItem = ["Küçük", "Normal", "Büyük", "Çok Büyük", "En Büyük"];
ValueNotifier<String> isSelect = ValueNotifier("Normal");

class _SettingsContentLetterSizePopupState extends BaseStatefulState<SettingsContentLetterSizePopup> {
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
              "İçerik Harf Boyutu",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.titleMedium?.color,
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
                              navigationService.popIfBackStackNotEmpty();
                            },
                          ),
                        ),
                      )
                          .toList(),
                    ],
                  );
                }),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => navigationService.popIfBackStackNotEmpty(),
                        child: Ink(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14),
                            child: Center(
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
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
