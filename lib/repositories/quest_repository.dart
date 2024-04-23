import 'package:sidequest/core/models/m_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class QuestRepository {
  final SupabaseClient _supabaseClient;

  QuestRepository({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  Future<void> createQuest() async {
    try {
      // final data = await _supabaseClient
      //     .from('profiles')
      //     .select('*, wallets(*)')
      //     .eq('id', userId)
      //     .limit(1)
      //     .single();
      //
      // final fromJson = AppUser.fromJson(data);
      //
      // return fromJson;
    } catch (error) {
      // return AppUser.empty;
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
