import 'package:flutter/material.dart';
import 'package:sidequest/core/theme/theme.dart';

class BrandTextInputTheme implements SingleBrandTheme<InputDecorationTheme> {
  final ColorScheme color;

  BrandTextInputTheme(this.color);

  @override
  InputDecorationTheme get c => InputDecorationTheme(
      helperMaxLines: 3,
      filled: true,
      isDense: true,
      labelStyle: const TextStyle(fontSize: 14),
      floatingLabelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5),
      ),
      helperStyle: TextStyle(color: color.outline, fontSize: 11.5),
      hintStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400)
      // indicatorSize: TabBarIndicatorSize.tab,
      // unselectedLabelColor: color.inverseSurface.withAlpha(210),
      // labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      // unselectedLabelStyle: const TextStyle(
      //   fontSize: 14,
      //   fontWeight: FontWeight.w400,
      // ),
      // overlayColor: MaterialStateProperty.resolveWith<Color?>(
      //         (Set<MaterialState> states) {
      //       // Use the default focused overlay color
      //       return states.contains(MaterialState.focused)
      //           ? null
      //           : Colors.transparent;
      //     }),
      );
}
