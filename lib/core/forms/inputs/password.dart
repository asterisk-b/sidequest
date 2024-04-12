import 'package:formz/formz.dart';

/// Email Form Input Validation Error
// enum PasswordValidationError { invalid }

/// {@template email}
/// Reusable email form input.
/// {@endtemplate}
class PasswordInput extends FormzInput<String, String> {
  /// {@macro email}
  const PasswordInput.pure() : super.pure('');

  /// {@macro email}
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    return value.isEmpty ? 'Please enter your password' : null;
  }
}
