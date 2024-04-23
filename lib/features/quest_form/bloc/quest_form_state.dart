part of 'quest_form_cubit.dart';

@JsonSerializable()
class QuestFormState extends Equatable {
  final SystemManager systemManager = SystemManager.instance;

  @JsonKey(
    name: 'level_required',
    fromJson: StringConverter.toInt,
    toJson: StringConverter.fromInt,
  )
  final int levelRequired;

  @JsonKey(
    name: 'max_questors',
    fromJson: StringConverter.toInt,
    toJson: StringConverter.fromInt,
  )
  final int maxQuestors;

  @JsonKey(
    name: 'currency_reward',
    fromJson: StringConverter.toDouble,
    toJson: StringConverter.fromDouble,
  )
  final double currencyRewards;

  QuestFormState({
    this.levelRequired = 0,
    this.maxQuestors = 0,
    this.currencyRewards = 0,
  });

  double get experienceReward {
    return systemManager.getExperienceFromLevel(level: levelRequired);
  }

  double get totalGoldReward => currencyRewards * maxQuestors;

  double get serviceFee => 5.0;

  double get totalPayment => totalGoldReward + serviceFee;

  factory QuestFormState.fromJson(Map<String, dynamic> json) =>
      _$QuestFormStateFromJson(json);

  Map<String, dynamic> toJson() => _$QuestFormStateToJson(this);

  @override
  List<Object> get props => [
        levelRequired,
        maxQuestors,
        currencyRewards,
      ];
}
