import 'package:formz/formz.dart';

enum PasswordValidationError {
  invalid,
  empty,
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure("");
  const Password.dirty(super.value) : super.dirty();
  static final _passwordRegExp = RegExp(r'^[A-Za-z\d@$!%*?&]{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }
    return _passwordRegExp.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;
  }
}
