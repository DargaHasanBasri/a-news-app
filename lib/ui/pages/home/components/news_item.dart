import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:flutter/material.dart';

import '../../../../utils/custom_colors.dart';

class NewsItem extends StatefulWidget {
  const NewsItem({super.key});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends BaseStatefulState<NewsItem> {
  ValueNotifier<bool> isSave = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("images/img_news_1.png"),
            ),
            const SizedBox(height: 20),
            Text(
              "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
              style: TextStyle(
                fontSize: 14,
                color: CustomColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Text(
                    "news.com.tr - 5 dakika",
                    style: TextStyle(
                      fontSize: 10,
                      color: CustomColors.textGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      ValueListenableBuilder(
                          valueListenable: isSave,
                          builder: (_, __, ___) {
                            return InkWell(
                              onTap: () => isSave.value = !isSave.value,
                              child: Ink(
                                child: Image.asset(
                                  isSave.value ? "images/ic_active_save.png" : "images/ic_inactive_save.png",
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                            );
                          }),
                      const SizedBox(width: 30),
                      InkWell(
                        onTap: () {},
                        child: Ink(
                          child: Image.asset(
                            "images/ic_share.png",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ],
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
