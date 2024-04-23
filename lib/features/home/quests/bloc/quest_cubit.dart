import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sidequest/core/models/_enums.dart';

part 'quest_state.dart';

@JsonSerializable()
class QuestCubit extends HydratedCubit<QuestState> {
  QuestCubit() : super(const QuestState());

  void switchQuestFilterMode(QuestTypes mode) {
    emit(state.copyWith(questFilterMode: mode));
  }

  @override
  QuestState? fromJson(Map<String, dynamic> json) {
    return QuestState(
      questFilterMode: QuestTypes.values[json['questFilterMode']],
    );
  }

  @override
  Map<String, dynamic>? toJson(QuestState state) {
    return <String, dynamic>{
      'questFilterMode': state.questFilterMode.index,
    };
  }
}
