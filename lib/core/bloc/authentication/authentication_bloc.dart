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
    on<FinishedOnboarding>(_onFinishedOnboarding);

    _authenticationSubscription = _authRepository.state.listen(
      (state) => add(_AuthenticationStatusChanged(state)),
    );
  }

  final AuthRepository _authRepository;
  late StreamSubscription<AuthState> _authenticationSubscription;

  Future<void> _onAuthenticationChanged(
    _AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    final ev = event.state.event;

    if (ev == AuthChangeEvent.signedIn ||
        ev == AuthChangeEvent.tokenRefreshed ||
        ev == AuthChangeEvent.mfaChallengeVerified ||
        ev == AuthChangeEvent.passwordRecovery ||
        ev == AuthChangeEvent.userUpdated) {
      final user = event.state.session?.user;
      if (user != null) return emit(AuthAuthenticated(user));
      return emit(AuthUnauthenticated());
    }

    if (ev == AuthChangeEvent.signedOut) {
      return emit(AuthUnauthenticated());
    }

    if (ev == AuthChangeEvent.userDeleted) {
      return emit(AuthUnknown());
    }
  }

  void _onFinishedOnboarding(
    FinishedOnboarding event,
    Emitter<AuthenticationState> emit,
  ) {
    return emit(AuthUnauthenticated());
  }

  void _onLogoutRequested(AuthenticationLogoutRequested event, dynamic emit) {
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
