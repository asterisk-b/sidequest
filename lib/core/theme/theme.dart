import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:sidequest/core/theme/theme_action_icon.dart';
import 'package:sidequest/core/theme/theme_appbar.dart';
import 'package:sidequest/core/theme/theme_segmented_button.dart';
import 'package:sidequest/core/theme/theme_tabbar.dart';
import 'package:sidequest/core/theme/theme_text_input.dart';

abstract class BrandTheme<T> {
  final T dark;
  final T light;

  BrandTheme._(this.dark, this.light);
}

abstract class SingleBrandTheme<T> {
  /// The theme component
  final T c;

  SingleBrandTheme._(this.c);
}

class AppTheme implements BrandTheme<ThemeData> {
  final ThemeData _l = FlexThemeData.light(
    scheme: FlexScheme.tealM3,
    visualDensity: VisualDensity.compact,
    useMaterial3: true,
  );

  final ThemeData _d = FlexThemeData.dark(
    scheme: FlexScheme.tealM3,
    visualDensity: VisualDensity.compact,
    useMaterial3: true,
  );

  // final _font = GoogleFonts.roboto();

  @override
  ThemeData get dark => _d.copyWith(
        appBarTheme: BrandAppBarTheme(_d.colorScheme).c,
        tabBarTheme: BrandTabBarTheme(_d.colorScheme).c,
        segmentedButtonTheme: BrandSegmentedButtonTheme(_d.colorScheme).c,
        actionIconTheme: BrandActionIconTheme(_d.colorScheme).c,
        inputDecorationTheme: BrandTextInputTheme(_d.colorScheme).c,
      );

  @override
  ThemeData get light => _l.copyWith(
        appBarTheme: BrandAppBarTheme(_l.colorScheme).c,
        tabBarTheme: BrandTabBarTheme(_l.colorScheme).c,
        segmentedButtonTheme: BrandSegmentedButtonTheme(_l.colorScheme).c,
        actionIconTheme: BrandActionIconTheme(_l.colorScheme).c,
        inputDecorationTheme: BrandTextInputTheme(_l.colorScheme).c,
      );
}
