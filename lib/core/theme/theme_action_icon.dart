import 'package:flutter/material.dart';
import 'package:sidequest/core/theme/theme.dart';

class BrandActionIconTheme implements SingleBrandTheme<ActionIconThemeData> {
  final ColorScheme color;

  BrandActionIconTheme(this.color);

  @override
  ActionIconThemeData get c => ActionIconThemeData(
        backButtonIconBuilder: (context) {
          return IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.chevron_left),
          );
        },
      );
}
