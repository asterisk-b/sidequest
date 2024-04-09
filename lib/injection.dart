import 'package:get_it/get_it.dart';
import 'package:sidequest/core/bloc/authentication/authentication_bloc.dart';
import 'package:sidequest/repositories/auth_repository.dart';
import 'package:sidequest/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final gt = GetIt.instance;

void injection() {
  final supabaseClient = Supabase.instance.client;

  gt.registerLazySingleton(
    () => AuthenticationBloc(
      authRepository: AuthRepository(auth: supabaseClient.auth),
    ),
  );

  gt.registerSingleton(UserRepository(supabaseClient: supabaseClient));
}
