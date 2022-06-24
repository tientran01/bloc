import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String? isLoading;
  final String? nameAndPassword;
  final String? password;
  final String? username;

  const LoginState({
    this.isLoading,
    this.nameAndPassword,
    this.password,
    this.username
  });

  const LoginState.initState() : this();

  LoginState copyWith(
      {String? isLoading, String? nameAndPassword, String? password, String? username}) {
    return LoginState(
        isLoading: isLoading,
        nameAndPassword: nameAndPassword,
        password: password,
        username: username
      );
  }

  @override
  List<Object?> get props => [isLoading, nameAndPassword, password, username];
}
