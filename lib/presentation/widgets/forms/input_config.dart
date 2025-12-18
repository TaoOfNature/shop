import 'package:flutter/material.dart';

class InputConfig {
  final String helperText;
  final double borderRadius;
  final bool autofocus;
  final TextStyle? textStyle; // 允许定制文字样式
  final Color? focusColor;
  final FormFieldValidator<String>? validator; // 引入 FormFieldValidator

  const InputConfig({
    this.helperText = "",
    this.borderRadius = 10.0,
    this.autofocus = false,
    this.textStyle,
    this.focusColor,
    this.validator,
  });
}
