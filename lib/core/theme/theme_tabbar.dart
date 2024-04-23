import 'package:flutter/material.dart';
import 'package:sidequest/core/theme/theme.dart';

class BrandTabBarTheme implements SingleBrandTheme<TabBarTheme> {
  final ColorScheme color;

  BrandTabBarTheme(this.color);

  @override
  TabBarTheme get c => TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: color.inverseSurface.withAlpha(210),
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          // Use the default focused overlay color
          return states.contains(MaterialState.focused)
              ? null
              : Colors.transparent;
        }),
      );
}
