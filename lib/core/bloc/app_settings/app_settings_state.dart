part of 'app_settings_cubit.dart';

final class AppSettingsState extends Equatable {
  const AppSettingsState({
    this.language = "en",
    this.mode = ThemeMode.system,
    this.startScreen = StartScreens.quests,
    this.uiScale = 100,
  });

  final String language;
  final ThemeMode mode;
  final StartScreens startScreen;
  final double uiScale;

  @override
  List<Object?> get props => [
        mode,
        startScreen,
        uiScale,
      ];

  AppSettingsState copyWith({
    String? language,
    ThemeMode? mode,
    StartScreens? startScreen,
    double? uiScale,
  }) {
    return AppSettingsState(
      language: language ?? this.language,
      mode: mode ?? this.mode,
      startScreen: startScreen ?? this.startScreen,
      uiScale: uiScale ?? this.uiScale,
    );
  }
}
