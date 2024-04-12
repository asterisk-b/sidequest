import 'package:flutter/material.dart';
import 'package:sidequest/core/theme/colors.dart';
import 'package:sidequest/core/theme/theme.dart';

class BrandInputTheme implements BrandTheme<InputDecorationTheme> {
  @override
  InputDecorationTheme get dark => InputDecorationTheme(
        // this.labelStyle,
        // this.floatingLabelStyle,
        // this.helperStyle,
        // this.helperMaxLines,
        // this.hintStyle,
        // this.hintFadeDuration,
        // this.errorStyle,
        // this.errorMaxLines,
        // this.floatingLabelBehavior = FloatingLabelBehavior.auto,
        // this.floatingLabelAlignment = FloatingLabelAlignment.start,
        // this.isDense = false,
        // this.contentPadding,
        // this.isCollapsed = false,
        // this.iconColor,
        // this.prefixStyle,
        // this.prefixIconColor,
        // this.suffixStyle,
        // this.suffixIconColor,
        // this.counterStyle,
        // this.filled = false,
        // this.fillColor,
        // this.activeIndicatorBorder,
        // this.outlineBorder,
        // this.focusColor,
        // this.hoverColor,
        // this.errorBorder,
        // this.focusedBorder,
        // this.focusedErrorBorder,
        // this.disabledBorder,
        // this.enabledBorder,
        // this.border,
        // this.alignLabelWithHint = false,
        // this.constraints,
        errorStyle: const TextStyle(color: Colors.red),
        floatingLabelStyle: TextStyle(color: TColors.darkSecondaryColor),
        labelStyle: TextStyle(color: TColors.neutralColor, fontSize: 14),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: TColors.darkSecondaryColor),
        ),
        helperStyle: TextStyle(fontSize: 10, color: Colors.grey.shade600),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        // activeIndicatorBorder: BorderSide(color: Colors.red),
        // border: UnderlineInputBorder(
        //   borderSide: BorderSide(color: Colors.teal),
        // ),
      );

  @override
  InputDecorationTheme get light => InputDecorationTheme(
        errorStyle: const TextStyle(color: Colors.red),
        floatingLabelStyle: TextStyle(color: TColors.lightSecondaryColor),
        labelStyle: TextStyle(color: TColors.neutralColor, fontSize: 14),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: TColors.lightSecondaryColor),
        ),
        helperStyle: TextStyle(fontSize: 10, color: Colors.grey.shade600),
        isDense: true,
        contentPadding: const EdgeInsets.only(bottom: 6, top: 0),

        // contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      );
}
