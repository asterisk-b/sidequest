// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_form_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestFormState _$QuestFormStateFromJson(Map<String, dynamic> json) =>
    QuestFormState(
      levelRequired: json['level_required'] == null
          ? 0
          : StringConverter.toInt(json['level_required']),
      maxQuestors: json['max_questors'] == null
          ? 1
          : StringConverter.toInt(json['max_questors']),
      currencyRewards: json['currency_reward'] == null
          ? 0
          : StringConverter.toDouble(json['currency_reward']),
    );

Map<String, dynamic> _$QuestFormStateToJson(QuestFormState instance) =>
    <String, dynamic>{
      'level_required': StringConverter.fromInt(instance.levelRequired),
      'max_questors': StringConverter.fromInt(instance.maxQuestors),
      'currency_reward': StringConverter.fromDouble(instance.currencyRewards),
    };
