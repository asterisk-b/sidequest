import 'package:flutter/material.dart';
import 'package:sidequest/core/theme/colors.dart';
import 'package:sidequest/core/theme/theme.dart';

class BrandProgressTheme implements BrandTheme<ProgressIndicatorThemeData> {
  @override
  ProgressIndicatorThemeData get dark => ProgressIndicatorThemeData(
        color: TColors.darkSecondaryColor,
        // this.linearTrackColor,
        // this.linearMinHeight,
        // this.circularTrackColor,
        // this.refreshBackgroundColor,
      );

  @override
  ProgressIndicatorThemeData get light => ProgressIndicatorThemeData(
        color: TColors.lightSecondaryColor,
      );
}
