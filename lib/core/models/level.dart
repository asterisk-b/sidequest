import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'level.g.dart';

@JsonSerializable()
class LevelModel extends Equatable {
  @JsonKey(name: 'base_level_requirement')
  final double baseLevelRequirement;

  @JsonKey(name: 'base_exp_gain')
  final double baseExpGain;

  @JsonKey(name: 'level_growth_factor')
  final double levelGrowthFactor;

  @JsonKey(name: 'exp_growth_factor')
  final double expGrowthFactor;

  @JsonKey(name: 'level_cap')
  final int levelCap;

  const LevelModel({
    this.baseLevelRequirement = 0,
    this.baseExpGain = 0,
    this.levelGrowthFactor = 0,
    this.expGrowthFactor = 0,
    this.levelCap = 0,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) =>
      _$LevelModelFromJson(json);

  Map<String, dynamic> toJson() => _$LevelModelToJson(this);

  @override
  List<Object> get props => [
        baseLevelRequirement,
        baseExpGain,
        levelGrowthFactor,
        expGrowthFactor,
        levelCap,
      ];
}
