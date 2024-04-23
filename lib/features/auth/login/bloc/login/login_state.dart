part of 'login_cubit.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.status = UIStatus.idle,
    this.errorMessage,
  });

  final UIStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [status];

  LoginState copyWith({UIStatus? status, String? errorMessage}) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
