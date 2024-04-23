import 'package:flutter/material.dart';
import 'package:sidequest/core/theme/theme.dart';

class BrandAppBarTheme implements SingleBrandTheme<AppBarTheme> {
  final ColorScheme color;

  BrandAppBarTheme(this.color);

  @override
  AppBarTheme get c => AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: color.inverseSurface,
        ),
        shape: Border(
          bottom: BorderSide(color: color.outline, width: 0.25),
        ),
      );
}
