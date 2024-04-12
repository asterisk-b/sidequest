part of 'app_settings_cubit.dart';

final class AppSettingsState extends Equatable {
  const AppSettingsState({
    this.mode = ThemeMode.light,
    this.isLoading = false,
    this.error,
  });

  final ThemeMode mode;
  final String? error;
  final bool isLoading;

  @override
  List<Object?> get props => [mode, isLoading];

  AppSettingsState copyWith({
    ThemeMode? mode,
    String? error,
    bool? isLoading,
  }) {
    return AppSettingsState(
      mode: mode ?? this.mode,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
