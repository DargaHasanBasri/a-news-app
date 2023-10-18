import 'package:flutter/material.dart';

import '../../../../utils/custom_colors.dart';

class SettingsItem extends StatefulWidget {
  final String? iconAddress;
  final String? title;
  final String? buttonIconAddress;
  final Function onPress;
  final Color? iconColor;
  const SettingsItem({
    super.key,
    this.iconAddress,
    this.title,
    this.buttonIconAddress,
    required this.onPress,
    this.iconColor,
  });

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => widget.onPress.call(),
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      Image.asset(
                        "${widget.iconAddress}",
                        height: 20,
                        width: 20,
                        color: widget.iconColor,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "${widget.title}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.black,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  RotatedBox(
                    quarterTurns: 2,
                    child: Image.asset(
                      widget.buttonIconAddress ?? "images/ic_arrow_back.png",
                      height: 12,
                      width: 12,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
