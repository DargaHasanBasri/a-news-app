import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:flutter/material.dart';
import '../../../utils/custom_colors.dart';

class CustomRadioButton extends StatefulWidget {
  final bool isSelected;
  final String title;
  final Function onSelected;
  const CustomRadioButton({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onSelected,
  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends BaseStatefulState<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(35),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => widget.onSelected.call(),
              child: Ink(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(35),
                  ),
                  border: Border.all(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
                child: widget.isSelected
                    ? Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).textTheme.titleMedium?.color,
          ),
        ),
      ],
    );
  }
}
