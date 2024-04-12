import 'package:flutter/material.dart';
import 'package:sidequest/core/theme/colors.dart';
import 'package:sidequest/core/theme/theme.dart';

class BrandSnackBarTheme implements BrandTheme<SnackBarThemeData> {
  @override
  SnackBarThemeData get dark => SnackBarThemeData(
        backgroundColor: TColors.darkPrimaryColor,
        contentTextStyle: const TextStyle(color: Colors.white),
        // this.backgroundColor,
        // this.actionTextColor,
        // this.disabledActionTextColor,
        // this.contentTextStyle,
        // this.elevation,
        // this.shape,
        // this.behavior,
        // this.width,
        // this.insetPadding,
        // this.showCloseIcon,
        // this.closeIconColor,
        // this.actionOverflowThreshold,
        // this.actionBackgroundColor,
        // this.disabledActionBackgroundColor,
        // this.dismissDirection,
      );

  @override
  SnackBarThemeData get light => const SnackBarThemeData(
        // backgroundColor: TColors.lightPrimaryColor,
        contentTextStyle: TextStyle(color: Colors.white),
      );
}
