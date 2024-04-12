import 'package:flutter/material.dart';
import 'package:sidequest/core/theme/colors.dart';
import 'package:sidequest/core/theme/theme.dart';

class BrandCardTheme implements BrandTheme<CardTheme> {
  @override
  CardTheme get dark => CardTheme(
        // this.clipBehavior,
        // this.color,
        // this.shadowColor,
        // this.surfaceTintColor,
        // this.elevation,
        // this.margin,
        // this.shape,
        color: TColors.darkPrimaryColor,
      );

  @override
  CardTheme get light => CardTheme(
        color: TColors.lightPrimaryColor,
      );
}
