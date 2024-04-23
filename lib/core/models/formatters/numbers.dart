import 'package:easy_localization/easy_localization.dart';

class NumberFormatter {
  const NumberFormatter._();

  static String decimal(dynamic value) {
    final formatter = NumberFormat.decimalPatternDigits(
      decimalDigits: 2,
    );

    return switch (value) {
      String s => formatter.format(s),
      double d => formatter.format(d),
      int i => formatter.format(i),
      _ => '0',
    };
  }

  static String currency(dynamic value) {
    final formatter = NumberFormat.decimalPatternDigits(
      decimalDigits: 2,
    );

    return switch (value) {
      String s => formatter.format(s),
      double d => formatter.format(d),
      int i => formatter.format(i),
      _ => '0',
    };
  }
}
