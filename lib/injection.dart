import 'package:get_it/get_it.dart';
import 'package:sidequest/core/bloc/authentication/authentication_bloc.dart';
import 'package:sidequest/core/bloc/user/user_cubit.dart';
import 'package:sidequest/repositories/auth_repository.dart';
import 'package:sidequest/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final gt = GetIt.instance;

void injection() {
  final supabaseClient = Supabase.instance.client;

  final authRepo = AuthRepository(auth: supabaseClient.auth);
  final userRepo = UserRepository(supabaseClient: supabaseClient);

  gt.registerSingleton<AuthRepository>(authRepo);
  gt.registerSingleton<UserRepository>(userRepo);

  gt.registerLazySingleton(
    () => AuthenticationBloc(authRepository: gt()),
  );

  gt.registerLazySingleton(
    () => UserCubit(authRepository: gt(), userRepository: gt()),
  );
}
