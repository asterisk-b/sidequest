import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidequest/core/models/_enums.dart';
import 'package:sidequest/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(AuthRepository authRepository)
      : _authRepository = authRepository,
        super(const LoginState());

  final AuthRepository _authRepository;

  Future<void> logInWithEmailAndPassword(Map<String, dynamic> values) async {
    emit(state.copyWith(status: UIStatus.loading));

    final task = _authRepository.logInWithEmailAndPassword(
      email: values['email'],
      password: values['password'],
    );

    final response = await task.run();

    response.match((l) {
      emit(state.copyWith(
        errorMessage: l.message,
        status: UIStatus.failure,
      ));
    }, (r) {
      emit(state.copyWith(status: UIStatus.success));
    });
  }

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: UIStatus.loading));
    try {
      await _authRepository.logInWithGoogle();
      emit(state.copyWith(status: UIStatus.success));
    } catch (error) {
      emit(state.copyWith(status: UIStatus.failure));
      addError(error);
    }
  }
}
