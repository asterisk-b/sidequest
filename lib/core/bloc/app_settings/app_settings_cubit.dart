import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_settings_state.dart';

class AppSettingsCubit extends HydratedCubit<AppSettingsState> {
  AppSettingsCubit() : super(const AppSettingsState());

  void switchTheme(ThemeMode mode) {
    emit(state.copyWith(mode: mode, isLoading: false));
  }

  @override
  AppSettingsState? fromJson(Map<String, dynamic> json) {
    final mode = json['mode'] == 'light'
        ? ThemeMode.light
        : json['mode'] == 'dark'
            ? ThemeMode.dark
            : ThemeMode.system;

    return AppSettingsState(mode: mode, isLoading: false);
  }

  @override
  Map<String, dynamic>? toJson(AppSettingsState state) {
    return <String, dynamic>{
      'mode': state.mode == ThemeMode.light
          ? 'light'
          : state.mode == ThemeMode.dark
              ? 'dark'
              : 'system',
    };
  }
}
