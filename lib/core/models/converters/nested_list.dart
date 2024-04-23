import 'package:json_annotation/json_annotation.dart';

class NestedListConverter
    extends JsonConverter<List<String>, Map<String, dynamic>> {
  const NestedListConverter();

  @override
  List<String> fromJson(Map<String, dynamic> json) {
    return [
      for (var e in json['items'] as List)
        (e as Map<String, dynamic>)['name'] as String
    ];
  }

  @override
  Map<String, dynamic> toJson(List<String> object) {
    return {
      'items': [
        for (var item in object) {'name': item}
      ]
    };
  }
}
