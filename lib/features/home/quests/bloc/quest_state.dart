part of 'quest_cubit.dart';

class QuestState extends Equatable {
  const QuestState({this.questFilterMode = QuestTypes.any});

  final QuestTypes questFilterMode;

  @override
  List<Object?> get props => [questFilterMode];

  QuestState copyWith({
    QuestTypes? questFilterMode,
  }) {
    return QuestState(
      questFilterMode: questFilterMode ?? this.questFilterMode,
    );
  }
}
