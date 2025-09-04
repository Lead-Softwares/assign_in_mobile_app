import 'package:assign_in/src/core/constants/my_colors.dart';
import 'package:assign_in/src/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class TextFeildWithTitle extends StatelessWidget {
  const TextFeildWithTitle({
    super.key,
    this.title,
    required this.label,
    required this.controller,
    this.obsecureText,
    this.sufix,
    this.maxlines,
    this.height,
    this.validator,
    this.prefix,
    this.fillColor,
    this.hintStyle,
  });
  final String? title;
  final String label;
  final bool? obsecureText;
  final Widget? sufix;
  final int? maxlines;
  final double? height;
  final Widget? prefix;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    if (title == null) return _customTextField(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 10),

        _customTextField(context),
      ],
    );
  }

  TextFormField _customTextField(BuildContext context) {
    return TextFormField(
      maxLines: maxlines ?? 1,
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Colors.black.withValues(alpha: 0.7),
      ),
      controller: controller,

      cursorHeight: 26,
      cursorColor: Colors.black54,
      decoration: InputDecoration(
        errorMaxLines: 2,
        prefixIconColor: Colors.black54,
        hintText: label,
        suffix: sufix,

        hintStyle: hintStyle ?? context.textTheme.bodyMedium,

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade100),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade100),
          borderRadius: BorderRadius.circular(6),
        ),

        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade300),
          borderRadius: BorderRadius.circular(6),
        ),

        errorStyle: TextStyle(
          color: Colors.red.shade600,
          fontSize: 10,
          fontWeight: FontWeight.w100,
        ),
        prefixIcon: prefix,

        floatingLabelStyle: TextStyle(
          color: MyColors.textColor.withValues(alpha: 0.8),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade100),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade100),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        suffixStyle: TextStyle(
          color: MyColors.textColor.withValues(alpha: 0.8),
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        fillColor: fillColor ?? Colors.grey.shade200,
        helperStyle: TextStyle(
          color: MyColors.textColor.withValues(alpha: 0.8),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: TextStyle(
          color: MyColors.textColor.withValues(alpha: 0.8),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
