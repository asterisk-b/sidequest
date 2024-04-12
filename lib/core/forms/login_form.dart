import 'package:formz/formz.dart';
import 'package:sidequest/core/forms/inputs/password.dart';

import 'inputs/email.dart';

class LoginFormZ with FormzMixin {
  LoginFormZ({required this.email, required this.password});

  final EmailInput email;
  final PasswordInput password;

  @override
  List<FormzInput> get inputs => [email, password];
}
