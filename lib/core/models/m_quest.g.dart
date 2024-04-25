// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_quest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quest _$QuestFromJson(Map<String, dynamic> json) => Quest(
      id: json['id'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      levelRequired: StringConverter.toInt(json['level_required']),
      currencyType: $enumDecode(_$WalletCurrencyEnumMap, json['currency_type']),
      currencyReward: StringConverter.toDouble(json['currency_reward']),
      expReward: StringConverter.toDouble(json['exp_reward']),
      status: $enumDecode(_$QuestStatusEnumMap, json['status']),
      maxQuestors: StringConverter.toInt(json['max_questors']),
    );

Map<String, dynamic> _$QuestToJson(Quest instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': _$QuestStatusEnumMap[instance.status]!,
      'currency_type': _$WalletCurrencyEnumMap[instance.currencyType]!,
      'level_required': StringConverter.fromInt(instance.levelRequired),
      'currency_reward': StringConverter.fromDouble(instance.currencyReward),
      'exp_reward': StringConverter.fromDouble(instance.expReward),
      'max_questors': StringConverter.fromInt(instance.maxQuestors),
    };

const _$WalletCurrencyEnumMap = {
  WalletCurrency.gold: 'gold',
  WalletCurrency.gem: 'gem',
};

const _$QuestStatusEnumMap = {
  QuestStatus.idle: 'idle',
  QuestStatus.ongoing: 'ongoing',
  QuestStatus.done: 'done',
  QuestStatus.terminated: 'terminated',
  QuestStatus.cancelled: 'cancelled',
};
