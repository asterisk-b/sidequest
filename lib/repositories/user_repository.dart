import 'package:sidequest/core/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseUserException implements Exception {
  const SupabaseUserException(this.error);
  final Object error;
}

class SupabaseUserInformationFailure extends SupabaseUserException {
  const SupabaseUserInformationFailure(super.error);
}

class SupabaseUpdateUserFailure extends SupabaseUserException {
  const SupabaseUpdateUserFailure(super.error);
}

class UserRepository {
  UserRepository({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  Future<AppUser> getProfile(String? id) async {
    try {
      final userId = id ?? _supabaseClient.auth.currentUser?.id ?? "fake_id";

      final data = await _supabaseClient
          .from('profiles')
          .select()
          .eq('id', userId)
          .single();

      return AppUser.fromJson(data);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SupabaseUserInformationFailure(error),
        stackTrace,
      );
    }
  }

  Future<void> update(AppUser user) async {
    try {
      await _supabaseClient.from('profiles').upsert(user.toJson());
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SupabaseUpdateUserFailure(error),
        stackTrace,
      );
    }
  }
}
