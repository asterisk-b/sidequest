import 'package:flutter/cupertino.dart';
import 'package:sidequest/core/models/m_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository {
  final SupabaseClient _supabaseClient;

  UserRepository({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  Future<AppUser> getProfile(String? id) async {
    final userId = id ?? _supabaseClient.auth.currentUser?.id ?? "faker";

    try {
      final data = await _supabaseClient
          .from('profiles')
          .select('*, wallets(*)')
          .eq('id', userId)
          .limit(1)
          .single();

      final fromJson = AppUser.fromJson(data);

      return fromJson;
    } catch (error) {
      debugPrint(error.toString());
      return AppUser.empty;
    }
  }

  Future<void> update(AppUser user) async {
    try {
      await _supabaseClient.from('profiles').upsert(user.toJson());
    } catch (error) {
      // Error.throwWithStackTrace(
      //   SupabaseUpdateUserFailure(error),
      //   stackTrace,
      // );
    }
  }
}
