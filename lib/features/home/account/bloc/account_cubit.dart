import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidequest/repositories/auth_repository.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(AuthRepository authRepository)
      : _authRepository = authRepository,
        super(AccountInitial());

  final AuthRepository _authRepository;

  void logout() => _authRepository.signOut();
}
