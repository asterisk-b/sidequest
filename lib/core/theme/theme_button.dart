import 'package:flutter/material.dart';
import 'package:sidequest/core/theme/colors.dart';
import 'package:sidequest/core/theme/theme.dart';

const double bButtonHeight = 38;
const double bButtonWidth = double.maxFinite;
const double bButtonRadius = 6;

class BrandElevatedButtonTheme implements BrandTheme<ElevatedButtonThemeData> {
  @override
  ElevatedButtonThemeData get dark => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          minimumSize: const Size(bButtonWidth, bButtonHeight),
          backgroundColor: TColors.darkSecondaryColor,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(bButtonRadius)),
          ),
        ),
      );

  @override
  ElevatedButtonThemeData get light => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          minimumSize: const Size(bButtonWidth, bButtonHeight),
          backgroundColor: TColors.lightSecondaryColor,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(bButtonRadius)),
          ),
        ),
      );
}

class BrandOutlinedButtonTheme implements BrandTheme<OutlinedButtonThemeData> {
  @override
  OutlinedButtonThemeData get dark => OutlinedButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: TColors.darkSecondaryColor,
          minimumSize: const Size(bButtonWidth, bButtonHeight),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(bButtonRadius)),
          ),
          side: BorderSide(color: TColors.neutralColor),
        ),
      );

  @override
  OutlinedButtonThemeData get light => OutlinedButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: TColors.lightSecondaryColor,
          minimumSize: const Size(bButtonWidth, bButtonHeight),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(bButtonRadius)),
          ),
          side: BorderSide(color: TColors.neutralColor),
        ),
      );
}

class BrandTextButtonTheme implements BrandTheme<TextButtonThemeData> {
  @override
  TextButtonThemeData get dark => TextButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: TColors.darkSecondaryColor,
          minimumSize: const Size(bButtonWidth, bButtonHeight),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(bButtonRadius)),
          ),
        ),
      );

  @override
  TextButtonThemeData get light => TextButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: TColors.lightSecondaryColor,
          minimumSize: const Size(bButtonWidth, bButtonHeight),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(bButtonRadius)),
          ),
        ),
      );
}

class BrandIconButtonTheme implements BrandTheme<IconButtonThemeData> {
  @override
  IconButtonThemeData get dark => IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: TColors.darkSecondaryColor,
          visualDensity: VisualDensity.comfortable,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      );

  @override
  IconButtonThemeData get light => IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: TColors.lightSecondaryColor,
          visualDensity: VisualDensity.comfortable,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      );
}
