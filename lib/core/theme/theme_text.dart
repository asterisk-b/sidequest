import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidequest/core/theme/theme.dart';

class BrandTextTheme implements BrandTheme<TextTheme> {
  @override
  TextTheme get dark => GoogleFonts.latoTextTheme();

  @override
  TextTheme get light => GoogleFonts.latoTextTheme();
}
