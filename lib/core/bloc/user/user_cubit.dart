import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidequest/core/models/m_user.dart';
import 'package:sidequest/repositories/auth_repository.dart';
import 'package:sidequest/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;
  late final StreamSubscription<AuthState> _authSubscription;

  UserCubit({
    required UserRepository userRepository,
    required AuthRepository authRepository,
  })  : _userRepository = userRepository,
        super(const UserState(user: AppUser.empty)) {
    _authSubscription = authRepository.state.listen((ev) {
      _fetchUser(ev.session?.user.id);
    });
  }

  Future<void> _fetchUser(String? id) async {
    emit(state.copyWith(isLoading: true));
    final user = await _userRepository.getProfile(id);
    emit(state.copyWith(isLoading: false, user: user));
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
