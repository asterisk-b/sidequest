// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelModel _$LevelModelFromJson(Map<String, dynamic> json) => LevelModel(
      baseLevelRequirement:
          (json['base_level_requirement'] as num?)?.toDouble() ?? 0,
      baseExpGain: (json['base_exp_gain'] as num?)?.toDouble() ?? 0,
      levelGrowthFactor: (json['level_growth_factor'] as num?)?.toDouble() ?? 0,
      expGrowthFactor: (json['exp_growth_factor'] as num?)?.toDouble() ?? 0,
      levelCap: json['level_cap'] as int? ?? 0,
    );

Map<String, dynamic> _$LevelModelToJson(LevelModel instance) =>
    <String, dynamic>{
      'base_level_requirement': instance.baseLevelRequirement,
      'base_exp_gain': instance.baseExpGain,
      'level_growth_factor': instance.levelGrowthFactor,
      'exp_growth_factor': instance.expGrowthFactor,
      'level_cap': instance.levelCap,
    };
