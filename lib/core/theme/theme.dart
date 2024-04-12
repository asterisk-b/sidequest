import 'package:flutter/material.dart';
import 'package:sidequest/core/theme/colors.dart';
import 'package:sidequest/core/theme/theme_appbar.dart';
import 'package:sidequest/core/theme/theme_button.dart';
import 'package:sidequest/core/theme/theme_card.dart';
import 'package:sidequest/core/theme/theme_input.dart';
import 'package:sidequest/core/theme/theme_progress.dart';
import 'package:sidequest/core/theme/theme_snackbar.dart';
import 'package:sidequest/core/theme/theme_text.dart';

abstract interface class BrandTheme<T> {
  final T light;
  final T dark;

  BrandTheme._(this.light, this.dark);
}

class AppTheme implements BrandTheme<ThemeData> {
  final textTheme = BrandTextTheme();
  final cardTheme = BrandCardTheme();
  final appbarTheme = BrandAppBarTheme();

  final elevatedButtonTheme = BrandElevatedButtonTheme();
  final iconButtonTheme = BrandIconButtonTheme();
  final outlinedButtonTheme = BrandOutlinedButtonTheme();
  final textButtonTheme = BrandTextButtonTheme();

  final inputTheme = BrandInputTheme();

  final snackBarTheme = BrandSnackBarTheme();
  final progressTheme = BrandProgressTheme();

  @override
  ThemeData get dark => ThemeData.dark().copyWith(
        primaryColor: TColors.darkPrimaryColor,

        textSelectionTheme: TextSelectionThemeData(
          cursorColor: TColors.darkSecondaryColor,
        ),

        ///.....
        scaffoldBackgroundColor: appbarTheme.dark.backgroundColor,
        textTheme: textTheme.dark,
        appBarTheme: appbarTheme.dark,

        elevatedButtonTheme: elevatedButtonTheme.dark,
        iconButtonTheme: iconButtonTheme.dark,
        outlinedButtonTheme: outlinedButtonTheme.dark,
        textButtonTheme: textButtonTheme.dark,

        inputDecorationTheme: inputTheme.dark,

        cardTheme: cardTheme.dark,
        snackBarTheme: snackBarTheme.dark,
        progressIndicatorTheme: progressTheme.dark,
      );

  @override
  ThemeData get light => ThemeData(
        useMaterial3: true,
        primaryColor: TColors.lightPrimaryColor,

        textSelectionTheme: TextSelectionThemeData(
          cursorColor: TColors.darkSecondaryColor,
        ),

        ///.....
        scaffoldBackgroundColor: appbarTheme.light.backgroundColor,
        textTheme: textTheme.light,
        appBarTheme: appbarTheme.light,

        elevatedButtonTheme: elevatedButtonTheme.light,
        iconButtonTheme: iconButtonTheme.light,
        outlinedButtonTheme: outlinedButtonTheme.light,
        textButtonTheme: textButtonTheme.light,

        inputDecorationTheme: inputTheme.light,

        cardTheme: cardTheme.light,
        snackBarTheme: snackBarTheme.light,
        progressIndicatorTheme: progressTheme.light,
      );
}
