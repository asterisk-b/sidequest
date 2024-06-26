import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidequest/core/models/_enums.dart';
import 'package:sidequest/repositories/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(AuthRepository authRepository)
      : _authRepository = authRepository,
        super(const RegisterState());

  final AuthRepository _authRepository;

  Future<void> registerWithEmailAndPassword(Map<String, dynamic> values) async {
    emit(state.copyWith(status: UIStatus.loading));

    final task = _authRepository.registerWithEmailAndPassword(
      email: values['email'],
      password: values['password'],
      data: {'full_name': values['full_name']},
    );

    final response = await task.run();

    response.match((l) {
      emit(state.copyWith(errorMessage: l.message, status: UIStatus.failure));
    }, (r) {
      emit(state.copyWith(status: UIStatus.success));
    });
  }
}
