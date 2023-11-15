import 'package:a_news_app/base/base_stateful_state.dart';
import 'package:flutter/material.dart';

import '../../../utils/custom_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final double borderRadius;
  final double contentPadding;
  final double hintFontSize;
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
  final String imageAddress;

  const CustomTextFormField({
    super.key,
    required this.controller,
    String? hintText,
    double? borderRadius,
    double? contentPadding,
    double? hintFontSize,
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
    String? imageAddress,
    this.onChanged,
    this.isRequired = false,
  })  : inputType = inputType ?? TextInputType.text,
        borderRadius = borderRadius ?? 16.0,
        contentPadding = contentPadding ?? 16.0,
        hintFontSize = hintFontSize ?? 14.0,
        textFieldBgColor = textFieldBgColor ?? Colors.white,
        disabledBorderColor = disabledBorderColor ?? Colors.transparent,
        enabledBorderColor = enabledBorderColor ?? Colors.transparent,
        focusedBorderColor = focusedBorderColor ?? Colors.transparent,
        borderColor = borderColor ?? Colors.transparent,
        hintText = hintText ?? "",
        multiline = multiline ?? false,
        isAutoTrue = isAutoTrue ?? false,
        maxLines = maxLines ?? 1,
        imageAddress = imageAddress ?? "images/ic_active_search.png";

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
        prefixIcon: Image.asset(
          widget.imageAddress,
          height: 20,
          width: 20,
          scale: 4,
          color: CustomColors.pastelGrey,
        ),
        contentPadding: EdgeInsets.all(widget.contentPadding),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: widget.hintFontSize,
          fontWeight: FontWeight.w500,
          color: CustomColors.osloGrey,
        ),
        filled: true,
        fillColor: widget.textFieldBgColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.disabledBorderColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.enabledBorderColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
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
