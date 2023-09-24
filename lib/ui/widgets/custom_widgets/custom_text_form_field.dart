import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:flutter/material.dart';

import '../../../utils/custom_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Function? onChanged;
  final bool? multiline;
  final int? maxLines;
  final TextInputType inputType;
  final Color textFieldBgColor;
  final Color disabledBorderColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color borderColor;
  final bool isRequired;
  final bool? isAutoTrue;

  CustomTextFormField({
    super.key,
    required this.controller,
    String? hintText,
    String? textFieldName,
    bool? multiline,
    bool? isAutoTrue,
    int? maxLines,
    TextInputType? inputType,
    Color? textFieldBgColor,
    Color? disabledBorderColor,
    Color? enabledBorderColor,
    Color? focusedBorderColor,
    Color? borderColor,
    this.onChanged,
    this.isRequired = false,
  })  : inputType = inputType ?? TextInputType.text,
        textFieldBgColor = textFieldBgColor ?? Colors.white,
        disabledBorderColor = disabledBorderColor ?? CustomColors.black.withOpacity(0.3),
        enabledBorderColor = enabledBorderColor ?? CustomColors.black.withOpacity(0.3),
        focusedBorderColor = focusedBorderColor ?? CustomColors.black.withOpacity(0.3),
        borderColor = borderColor ?? CustomColors.black.withOpacity(0.3),
        hintText = hintText ?? "",
        multiline = multiline ?? false,
        isAutoTrue = isAutoTrue ?? false,
        maxLines = maxLines ?? 1;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends BaseStatefulState<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autofocus: widget.isAutoTrue ?? false,
      keyboardType: widget.inputType,
      maxLines: widget.maxLines,
      onChanged: _onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: CustomColors.black,
        ),
        filled: true,
        fillColor: widget.textFieldBgColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: widget.borderColor,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: widget.disabledBorderColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: widget.enabledBorderColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: widget.focusedBorderColor,
            width: 2,
          ),
        ),
      ),
    );
  }

  void _onChanged(String value) {
    if (widget.onChanged != null) widget.onChanged!(value.trim());
  }
}
