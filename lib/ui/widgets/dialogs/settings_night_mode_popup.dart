import 'package:a_news_app/theme_preferences.dart';
import 'package:a_news_app/ui/widgets/custom_widgets/custom_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../base/base_stateful_state.dart';
import '../../../generated/l10n.dart';

class SettingsNightModePopup extends StatefulWidget {
  const SettingsNightModePopup({super.key});

  @override
  State<SettingsNightModePopup> createState() => _SettingsNightModePopupState();
}

List<String> radioItem = [
  S.current.luminousTheme,
  S.current.darkTheme,
  S.current.automatic,
];
ValueNotifier<String> isSelect = ValueNotifier(S.current.luminousTheme);

class _SettingsNightModePopupState extends BaseStatefulState<SettingsNightModePopup> {
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
              S.current.nightMode,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.titleMedium?.color,
              ),
            ),
            const SizedBox(height: 20),
            Consumer<ThemePreferences>(
              builder: (context, provider, child) {
                return ValueListenableBuilder(
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
                                      provider.changeTheme(isSelect.value ?? S.current.automatic);
                                    },
                                  ),
                                ),
                              )
                              .toList(),
                        ],
                      );
                    });
              },
            ),
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
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Center(
                              child: Text(
                                S.current.cancel,
                                style: const TextStyle(
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
