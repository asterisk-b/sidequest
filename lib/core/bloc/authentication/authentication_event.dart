part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

final class _AuthenticationStatusChanged extends AuthenticationEvent {
  const _AuthenticationStatusChanged(this.session);
  final Session? session;
}

final class AuthenticationLogoutRequested extends AuthenticationEvent {}