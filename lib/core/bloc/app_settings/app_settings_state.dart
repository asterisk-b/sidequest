part of 'app_settings_cubit.dart';

final class AppSettingsState extends Equatable {
  const AppSettingsState({
    this.language = "en",
    this.mode = ThemeMode.system,
    this.uiScale = 100,
  });

  final String language;
  final ThemeMode mode;
  final double uiScale;

  @override
  List<Object?> get props => [
        mode,
        uiScale,
      ];

  AppSettingsState copyWith({
    String? language,
    ThemeMode? mode,
    double? uiScale,
  }) {
    return AppSettingsState(
      language: language ?? this.language,
      mode: mode ?? this.mode,
      uiScale: uiScale ?? this.uiScale,
    );
  }
}
