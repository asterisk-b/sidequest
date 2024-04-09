import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseAuthException implements Exception {
  const SupabaseAuthException(this.error);
  final Object error;
}

class SupabaseLoginWithEmailAndPasswordFailure extends SupabaseAuthException {
  const SupabaseLoginWithEmailAndPasswordFailure(super.error);
}

class SupabaseLogoutOutFailure extends SupabaseAuthException {
  const SupabaseLogoutOutFailure(super.error);
}

class AuthRepository {
  AuthRepository({required GoTrueClient auth}) : _auth = auth;

  final GoTrueClient _auth;

  Stream<Session?> get state {
    return _auth.onAuthStateChange.map((state) {
      // Better write to cache
      return state.session;
    });
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithPassword(email: email, password: password);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SupabaseLoginWithEmailAndPasswordFailure(error),
        stackTrace,
      );
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(SupabaseLogoutOutFailure(error), stackTrace);
    }
  }
}
