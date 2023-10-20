import 'package:a_news_app/ui/pages/settings/components/settings_item.dart';
import 'package:a_news_app/ui/widgets/dialogs/settings_content_letter_size_popup.dart';
import 'package:a_news_app/ui/widgets/dialogs/settings_country_popup.dart';
import 'package:a_news_app/ui/widgets/dialogs/settings_night_mode_popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../base/base_stateful_state.dart';
import '../../../generated/l10n.dart';
import '../../widgets/dialogs/settings_language_popup.dart';
import 'components/build_title_content.dart';
import 'settings_view_model.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends BaseStatefulState<SettingsPage> {
  late final SettingsViewModel vm;
  late final ScrollController _pageScrollController;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<SettingsViewModel>(context, listen: false);
    _pageScrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            const SizedBox(height: 40),
            Expanded(
              child: SingleChildScrollView(
                controller: _pageScrollController,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SettingsItem(
                        onPress: () {},
                        title: S.current.notifications,
                        iconAddress: "images/ic_notification.png",
                        iconColor: Colors.red,
                      ),
                      const SizedBox(height: 10),
                      SettingsItem(
                        onPress: () => showLanguagePopup(
                          const SettingsNightModePopup(),
                        ),
                        title: S.current.nightMode,
                        iconAddress: "images/ic_night_mode.png",
                      ),
                      const SizedBox(height: 80),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BuildTitleContent(
                                  title: S.current.changeLanguage,
                                  subTitle: S.current.turkish,
                                  onPress: () => showLanguagePopup(
                                    const SettingsLanguagePopup(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BuildTitleContent(
                                  title: S.current.changeCountry,
                                  subTitle: S.current.turkish,
                                  onPress: () => showLanguagePopup(
                                    const SettingsCountryPopup(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BuildTitleContent(
                                  title: S.current.contentLetterSize,
                                  subTitle: S.current.normal,
                                  onPress: () => showLanguagePopup(
                                    const SettingsContentLetterSizePopup(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BuildTitleContent(
                                  title: S.current.scoring,
                                  subTitle: "",
                                  onPress: () => showLanguagePopup(
                                    const SettingsLanguagePopup(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BuildTitleContent(
                                  title: S.current.comment,
                                  subTitle: "",
                                  onPress: () => showLanguagePopup(
                                    const SettingsLanguagePopup(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BuildTitleContent(
                                  title: S.current.shareApp,
                                  subTitle: "",
                                  onPress: () => showLanguagePopup(
                                    const SettingsLanguagePopup(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BuildTitleContent(
                                  title: S.current.termsOfUse,
                                  subTitle: "",
                                  onPress: () => showLanguagePopup(
                                    const SettingsLanguagePopup(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BuildTitleContent(
                                  title: S.current.aboutApp,
                                  subTitle: "",
                                  onPress: () => showLanguagePopup(
                                    const SettingsLanguagePopup(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BuildTitleContent(
                                  title: S.current.version,
                                  subTitle: "1.0.0",
                                  onPress: null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => navigationService.popIfBackStackNotEmpty(),
                  child: Ink(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        "images/ic_arrow_back.png",
                        height: 20,
                        width: 20,
                        color: Theme.of(context).textTheme.titleMedium?.color,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                S.current.settings,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).textTheme.titleMedium?.color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showLanguagePopup(var popup) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return popup;
      },
    );
  }
}
