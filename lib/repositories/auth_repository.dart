import 'dart:async';

import 'package:google_sign_in/google_sign_in.dart';
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

  Future<void> logInWithGoogle() async {
    try {
      /// TODO: update the Web client ID with your own.
      ///
      /// Web Client ID that you registered with Google Cloud.
      const webClientId = 'my-web.apps.googleusercontent.com';

      /// TODO: update the iOS client ID with your own.
      ///
      /// iOS Client ID that you registered with Google Cloud.
      const iosClientId = 'my-ios.apps.googleusercontent.com';

      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: iosClientId,
        serverClientId: webClientId,
      );

      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }

      await _auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
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
