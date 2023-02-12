import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils.dart';

class ThemeUtils {
  static InputDecoration textFormFieldDecoration({
    required final String label,
    final String? hint,
    final String? suffixText,
    final String? helpText,
    final Widget? prefixIcon,
  }) =>
      InputDecoration(
        hintText: hint,
        labelText: label,
        contentPadding: Utils.smallPadding,
        filled: true,
        prefixIcon: prefixIcon,
        labelStyle: Get.textTheme.caption,
        hintStyle: Get.textTheme.caption,
        helperText: helpText,
        errorStyle: errorTextStyle(),
        focusedBorder: ThemeUtils.setOutlineBorder(
            color: Get.theme.colorScheme.primary, width: 2.0),
        errorBorder: setOutlineBorder(color: Get.theme.errorColor, width: 2.0),
        fillColor: Get.theme.colorScheme.background,
        suffixText: suffixText,
        enabledBorder: ThemeUtils.setOutlineBorder(
            color: Get.theme.colorScheme.primary, width: 1.0),
      );

  static TextStyle errorTextStyle() => TextStyle(color: Get.theme.errorColor);

  static OutlineInputBorder setOutlineBorder(
          {required final Color color, final double width = 1}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(Utils.mediumSpace),
        borderSide: BorderSide(width: width, color: color),
      );

  static ButtonStyle errorOutlineButtonStyle() => OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: BorderSide(
          style: BorderStyle.solid,
          color: Get.theme.colorScheme.error,
          width: 2.0,
        ),
      );
}
