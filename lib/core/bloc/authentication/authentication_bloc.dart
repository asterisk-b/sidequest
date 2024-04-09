import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sidequest/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part './authentication_event.dart';
part './authentication_state.dart';

class AuthenticationBloc
    extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthUnknown()) {
    on<_AuthenticationStatusChanged>(_onAuthenticationChanged);
    on<AuthenticationLogoutRequested>(_onLogoutRequested);

    _authenticationSubscription = _authRepository.state.listen(
      (session) => add(_AuthenticationStatusChanged(session)),
    );
  }

  final AuthRepository _authRepository;
  late StreamSubscription<Session?> _authenticationSubscription;

  Future<void> _onAuthenticationChanged(
    _AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    final user = event.session?.user;

    if (user == null) return emit(AuthUnauthenticated());

    return emit(AuthAuthenticated(user));
  }

  void _onLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    unawaited(_authRepository.signOut());
  }

  @override
  AuthenticationState? fromJson(Map<String, dynamic>? json) {
    if (json == null) return AuthUnknown();
    if (json.isEmpty) return AuthUnauthenticated();

    return AuthAuthenticated(User(
      id: json['id'] as String,
      appMetadata: <String, dynamic>{},
      userMetadata: <String, dynamic>{},
      aud: json['aud'],
      createdAt: json['createdAt'],
    ));
  }

  @override
  Map<String, dynamic>? toJson(AuthenticationState state) {
    if (state is AuthAuthenticated) {
      return <String, dynamic>{
        'id': state.user.id,
        'aud': state.user.aud,
        'createdAt': state.user.createdAt,
      };
    }

    if (state is AuthUnauthenticated) return <String, dynamic>{};
    return null;
  }

  @override
  Future<void> close() {
    _authenticationSubscription.cancel();
    return super.close();
  }
}
