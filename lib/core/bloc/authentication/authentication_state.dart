part of 'authentication_bloc.dart';

sealed class AuthenticationState {
  const AuthenticationState();
}

final class AuthAuthenticated extends AuthenticationState with EquatableMixin {
  const AuthAuthenticated(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}

final class AuthUnauthenticated extends AuthenticationState {}

final class AuthUnknown extends AuthenticationState {}
