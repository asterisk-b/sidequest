import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sidequest/core/models/converters/string.dart';
import 'package:sidequest/core/models/mngr_system.dart';

part 'quest_form_cubit.g.dart';
part 'quest_form_state.dart';

class QuestFormCubit extends Cubit<QuestFormState> {
  QuestFormCubit() : super(QuestFormState());

  void setValues(Map<String, dynamic>? json) {
    if (json == null) return;
    emit(QuestFormState.fromJson(json));
  }

  void submitQuest(Map<String, dynamic>? json) {
    if (json == null) return;
  }
}
