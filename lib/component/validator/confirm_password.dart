import 'package:formz/formz.dart';

enum ConfirmPasswordValidationError {
  invalid,
  mismatch,
}

class ConfirmPassword
    extends FormzInput<String, ConfirmPasswordValidationError> {
  final String? password;
  ConfirmPassword.pure({
    this.password = '',
  }) : super.pure('');

  ConfirmPassword.dirty({
    String value = "",
    this.password,
  }) : super.dirty(value);

  @override
  ConfirmPasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return ConfirmPasswordValidationError.invalid;
    }
    return password == value ? null : ConfirmPasswordValidationError.mismatch;
  }
}
