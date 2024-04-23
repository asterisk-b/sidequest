import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

const _formatter = 'yyyy-MM-dd HH:mm:ss.SSSSSSZ';

class SPDateTimeConverter implements JsonConverter<DateTime, String> {
  const SPDateTimeConverter();

  @override
  DateTime fromJson(String json) {
    final formatter = DateFormat(_formatter);
    return formatter.parse(json);
  }

  @override
  String toJson(DateTime dt) {
    final formatter = DateFormat(_formatter);
    return formatter.format(dt);
  }
}



// class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
//   const TimestampConverter();
//
//   @override
//   DateTime fromJson(Timestamp timestamp) {
//     return timestamp.toDate();
//   }
//
//   @override
//   Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
// }
