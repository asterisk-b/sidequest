import 'package:easy_localization/easy_localization.dart';

class StringConverter {
  const StringConverter._();

  static int toInt(dynamic value) {
    return switch (value) {
      double d => d.toInt(),
      String s => int.tryParse(s) ?? 0,
      _ => 0,
    };
  }

  static String fromInt(int? value) {
    return value == null ? '0' : value.toString();
  }

  static double toDouble(dynamic value) {
    return switch (value) {
      int i => i.toDouble(),
      String s => double.tryParse(s) ?? 0.0,
      _ => 0.0,
    };
  }

  static String fromDouble(double? value) {
    return value == null ? '0.0' : value.toString();
  }

  static DateTime? toDateTime(String? value) {
    if (value == null || value.isEmpty) return null;
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss.SSSSSSZ');
    return formatter.parse(value);
  }

  static String? fromDateTime(DateTime? value) {
    if (value == null) return null;
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss.SSSSSSZ');
    return formatter.format(value);
  }
}
