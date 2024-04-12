import 'package:flutter/material.dart';
import 'package:sidequest/core/theme/colors.dart';
import 'package:sidequest/core/theme/theme.dart';

class BrandAppBarTheme implements BrandTheme<AppBarTheme> {
  @override
  AppBarTheme get dark => AppBarTheme(
        // this.foregroundColor,
        // this.elevation,
        // this.scrolledUnderElevation,
        // this.shadowColor,
        // this.surfaceTintColor,
        // this.shape,
        // this.iconTheme,
        // this.actionsIconTheme,
        // this.centerTitle,
        // this.titleSpacing,
        // this.toolbarHeight,
        // this.toolbarTextStyle,
        // this.titleTextStyle,
        // this.systemOverlayStyle,
        centerTitle: true,
        backgroundColor: TColors.darkBaseColor2,
      );

  @override
  AppBarTheme get light => AppBarTheme(
        centerTitle: true,
        backgroundColor: TColors.lightBaseColor0,
      );
}
