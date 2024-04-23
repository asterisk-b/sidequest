import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sidequest/core/models/_enums.dart';
import 'package:sidequest/core/models/converters/string.dart';

part 'm_quest.g.dart';

@JsonSerializable()
class Quest extends Equatable {
  final String? id;
  final String title;
  final String description;
  final QuestStatus status;

  @JsonKey(name: 'currency_type')
  final WalletCurrency currencyType;

  @JsonKey(
    name: 'level_required',
    fromJson: StringConverter.toInt,
    toJson: StringConverter.fromInt,
  )
  final int levelRequired;

  @JsonKey(
    name: 'currency_reward',
    fromJson: StringConverter.toDouble,
    toJson: StringConverter.fromDouble,
  )
  final double currencyReward;

  @JsonKey(
    name: 'exp_reward',
    fromJson: StringConverter.toDouble,
    toJson: StringConverter.fromDouble,
  )
  final double expReward;

  @JsonKey(
    name: 'max_questors',
    fromJson: StringConverter.toInt,
    toJson: StringConverter.fromInt,
  )
  final int maxQuestors;

  const Quest({
    this.id,
    required this.title,
    required this.description,
    required this.levelRequired,
    required this.currencyType,
    required this.currencyReward,
    required this.expReward,
    required this.status,
    required this.maxQuestors,
  });

  factory Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);
  Map<String, dynamic> toJson() => _$QuestToJson(this);

  @override
  List<Object> get props => [
        title,
        description,
        levelRequired,
        currencyType,
        currencyReward,
        expReward,
        status,
        maxQuestors,
      ];
}
