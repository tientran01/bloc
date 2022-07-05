import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String? password;
  final String? email;
  final bool? isPasswordInvalid;
  final bool? isEmailInvalid;
  bool get isFormValid => (isEmailInvalid ?? false) && (isPasswordInvalid ?? false);
  const LoginState({
    this.password,
    this.email,
    this.isPasswordInvalid,
    this.isEmailInvalid,
  });

  const LoginState.initState() : this();

  LoginState copyWith({
    String? password,
    String? email,
    bool? isPasswordInvalid,
    bool? isEmailInvalid,
  }) {
    return LoginState(
      password: password,
      email: email,
      isPasswordInvalid: isPasswordInvalid ?? true,
      isEmailInvalid: isEmailInvalid ?? true,
    );
  }

  @override
  List<Object?> get props =>
      [password, email, isPasswordInvalid, isEmailInvalid];
}
