import 'package:flutter/material.dart';
import 'package:onelancer_flutter/theme/appTheme.dart';
import 'package:onelancer_flutter/theme/customTextStyles.dart';

class OFTextFormField extends StatelessWidget {
  final TextEditingController controller;
  // final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool readOnly;
  final Color? fillColor;
  final Color? borderColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry contentPadding;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final int? minLines;

  const OFTextFormField({
    Key? key,
    required this.controller,
    // this.labelText,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.readOnly = false,
    this.fillColor,
    this.borderColor,
    this.borderRadius = 10.0,
    this.textStyle,
    this.contentPadding = const EdgeInsets.all(12.0),
    this.onChanged,
    this.validator,
    this.maxLines,
    this.minLines
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onChanged: onChanged,
      validator: validator,
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        // labelText: labelText,
        hintText: hintText,
        hintStyle: CustomTextStyles.titleMediumBluegray40001Medium,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        contentPadding: contentPadding,
        filled: true,
        fillColor: fillColor ?? themeColors.indigo50,
        border:
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: themeColors.teal100,
                width: 2,
              ),
            ),
        enabledBorder:
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: themeColors.teal50,
                width: 2,
              ),
            ),
        focusedBorder:
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: themeColors.teal100,
                width: 2,
              ),
            ),
      ),
      style: textStyle ?? CustomTextStyles.bodyLargeBlack,


    );
  }
}
