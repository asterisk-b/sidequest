part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

final class _AuthenticationStatusChanged extends AuthenticationEvent {
  const _AuthenticationStatusChanged(this.state);
  final AuthState state;
}

final class FinishedOnboarding extends AuthenticationEvent {}

final class AuthenticationLogoutRequested extends AuthenticationEvent {}
