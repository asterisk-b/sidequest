import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  AuthRepository({required GoTrueClient auth}) : _auth = auth;

  final GoTrueClient _auth;

  Stream<AuthState> get state => _auth.onAuthStateChange.map((state) => state);

  TaskEither<AuthException, void> registerWithEmailAndPassword({
    required String email,
    required String password,
    Map<String, dynamic>? data,
  }) {
    return TaskEither.tryCatch(() async {
      await _auth.signUp(
        email: email,
        password: password,
        data: data != null ? {'full_name': data['full_name']} : null,
      );
    }, (error, stackTrace) => error as AuthException);
  }

  TaskEither<AuthException, void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return TaskEither.tryCatch(() async {
      await _auth.signInWithPassword(email: email, password: password);
    }, (error, stackTrace) => error as AuthException);
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
    } catch (error) {
      // Error.throwWithStackTrace(
      //   SupabaseLoginWithEmailAndPasswordFailure(error),
      //   stackTrace,
      // );
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();

    // try {
    //   await _auth.signOut();
    // } catch (error, stackTrace) {
    //   Error.throwWithStackTrace(SupabaseLogoutOutFailure(error), stackTrace);
    // }
  }
}
