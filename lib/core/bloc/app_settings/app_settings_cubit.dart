import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sidequest/core/models/_enums.dart';

part 'app_settings_state.dart';

class AppSettingsCubit extends HydratedCubit<AppSettingsState> {
  AppSettingsCubit() : super(const AppSettingsState());

  void switchTheme(ThemeMode? mode) {
    emit(state.copyWith(mode: mode ?? state.mode));
  }

  void switchStartScreen(StartScreens? screen) {
    emit(state.copyWith(startScreen: screen ?? state.startScreen));
  }

  void increaseUI() {
    if (state.uiScale < 120) {
      emit(state.copyWith(uiScale: state.uiScale + 10));
    }
  }

  void decreaseUI() {
    if (state.uiScale > 80) {
      emit(state.copyWith(uiScale: state.uiScale - 10));
    }
  }

  void setUIScale(double scale) => emit(state.copyWith(uiScale: scale));

  void translateLanguage(String language) {
    emit(state.copyWith(language: language));
  }

  void resetSettings() => emit(const AppSettingsState());

  @override
  AppSettingsState? fromJson(Map<String, dynamic> json) {
    final scale = json['uiScale'];
    final language = json['language'];

    return AppSettingsState(
      mode: ThemeMode.values[json['mode']],
      startScreen: StartScreens.values[json['startScreen']],
      uiScale: scale,
      language: language,
    );
  }

  @override
  Map<String, dynamic>? toJson(AppSettingsState state) {
    return <String, dynamic>{
      'mode': state.mode.index,
      'startScreen': state.startScreen.index,
      'uiScale': state.uiScale,
      'language': state.language,
    };
  }
}
