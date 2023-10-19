import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:a_news_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class BuildTitleContent extends StatefulWidget {
  final String? title;
  final String? subTitle;
  final Function? onPress;
  const BuildTitleContent({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onPress,
  });

  @override
  State<BuildTitleContent> createState() => _BuildTitleContentState();
}

class _BuildTitleContentState extends BaseStatefulState<BuildTitleContent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPress?.call(),
      child: Ink(
        child: Row(
          children: [
            Text(
              widget.title ?? "",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.titleMedium?.color,
              ),
            ),
            const Spacer(),
            Text(
              widget.subTitle ?? "",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).textTheme.titleMedium?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
