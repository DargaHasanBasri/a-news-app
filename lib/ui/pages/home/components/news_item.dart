import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:flutter/material.dart';

import '../../../../utils/custom_colors.dart';

class NewsItem extends StatefulWidget {
  const NewsItem({super.key});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends BaseStatefulState<NewsItem> {
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
          ],
        ),
      ),
    );
  }
}
