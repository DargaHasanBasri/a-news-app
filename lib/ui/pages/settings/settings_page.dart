import 'package:a_news_app/ui/pages/search/components/settings_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../base/base_stateful_state.dart';
import '../../../utils/custom_colors.dart';
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
                        title: "Bildirimler",
                        iconAddress: "images/ic_notification.png",
                        iconColor: Colors.red,
                      ),
                      const SizedBox(height: 10),
                      SettingsItem(
                        onPress: () {},
                        title: "Gece Modu",
                        iconAddress: "images/ic_home_active.png",
                        iconColor: Colors.red,
                      ),
                      const SizedBox(height: 80),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: _buildTitleContent("Dili Değiştir", "Türkçe"),
                              ),
                              const SizedBox(height: 50),
                              GestureDetector(
                                onTap: () {},
                                child: _buildTitleContent("Ülkeyi Değiştir", "Türkiye"),
                              ),
                              const SizedBox(height: 50),
                              GestureDetector(
                                onTap: () {},
                                child: _buildTitleContent("İçerik Harf Boyutu", "Normal"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: _buildTitleContent("Puanla", ""),
                              ),
                              const SizedBox(height: 50),
                              GestureDetector(
                                onTap: () {},
                                child: _buildTitleContent("Yorum Gönder", ""),
                              ),
                              const SizedBox(height: 50),
                              GestureDetector(
                                onTap: () {},
                                child: _buildTitleContent("A-News-App's paylaş", ""),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: _buildTitleContent("Kullanım Koşulları", ""),
                              ),
                              const SizedBox(height: 50),
                              GestureDetector(
                                onTap: () {},
                                child: _buildTitleContent("A-News-App Hakkında", ""),
                              ),
                              const SizedBox(height: 50),
                              GestureDetector(
                                onTap: () {},
                                child: _buildTitleContent("Version", "1.0.0"),
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

  Widget _buildTitleContent(String? title, String? subTitle) {
    return Row(
      children: [
        Text(
          title ?? "",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: CustomColors.black,
          ),
        ),
        const Spacer(),
        Text(
          subTitle ?? "",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: CustomColors.black,
          ),
        ),
      ],
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
                "AYARLAR",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: CustomColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
