import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:flutter/material.dart';

import '../../../utils/custom_colors.dart';

class CustomButton extends StatefulWidget {
  final Color? backgroundColor;
  final String? title;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final Color? titleFontColor;
  final double borderRadius;
  final Function? onPress;

  CustomButton(
      {super.key,
      Color? backgroundColor,
      String? title,
      double? titleFontSize,
      FontWeight? titleFontWeight,
      Color? titleFontColor,
      double? borderRadius,
      Function? onPress})
      : title = title ?? "TEST",
        backgroundColor = backgroundColor ?? CustomColors.black,
        titleFontColor = titleFontColor ?? CustomColors.white,
        borderRadius = borderRadius ?? 25.0,
        titleFontSize = titleFontSize ?? 18.0,
        titleFontWeight = titleFontWeight ?? FontWeight.w400,
        onPress = onPress ?? (() {});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends BaseStatefulState<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => widget.onPress?.call(),
            child: Ink(
              height: 60,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              child: Center(
                child: Text(
                  widget.title ?? "",
                  style: TextStyle(
                    color: widget.titleFontColor,
                    fontSize: widget.titleFontSize,
                    fontWeight: widget.titleFontWeight,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
