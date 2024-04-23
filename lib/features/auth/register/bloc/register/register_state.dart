part of 'register_cubit.dart';

final class RegisterState extends Equatable {
  const RegisterState({
    this.status = UIStatus.idle,
    this.errorMessage,
  });

  final UIStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [status];

  RegisterState copyWith({
    UIStatus? status,
    String? errorMessage,
  }) {
    return RegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
