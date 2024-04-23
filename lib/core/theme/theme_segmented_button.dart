import 'package:flutter/material.dart';
import 'package:sidequest/core/theme/theme.dart';

class BrandSegmentedButtonTheme
    implements SingleBrandTheme<SegmentedButtonThemeData> {
  final ColorScheme color;

  BrandSegmentedButtonTheme(this.color);

  @override
  SegmentedButtonThemeData get c => SegmentedButtonThemeData(
        style: SegmentedButton.styleFrom(
          visualDensity: VisualDensity.compact,
          textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          // selectedBackgroundColor: color.primary,
          // selectedForegroundColor: color.onSecondary,
        ),
      );
}
