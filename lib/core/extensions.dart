import 'package:flutter/material.dart';

extension DarkMode on BuildContext {
  bool get isDark {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}
