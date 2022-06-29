import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final String? email;
  final String? password;
  const RegisterState({this.email, this.password});
  const RegisterState.initState() : this();

  RegisterState copyWith({String? email, String? password}) {
    return RegisterState(email: email, password: password);
  }

  @override
  List<Object?> get props => [email, password];
}
