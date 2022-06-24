import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class GetDataFromTextFieldEvent extends LoginEvent {
  final String? value;

  const GetDataFromTextFieldEvent({this.value});

  @override
  List<Object?> get props => [value];
}

class GetUsernameAndPasswordFormTextFieldEvent extends LoginEvent {
  final String? username;
  final String? password;
  const GetUsernameAndPasswordFormTextFieldEvent({this.username,this.password,});

  @override
  List<Object?> get props => [username,password,];
}

class GetPasswordFromTextFieldEvent extends LoginEvent {
  final String? password;
  const GetPasswordFromTextFieldEvent({this.password});
  @override
  List<Object?> get props => [password];
}

class ShowUserNameAndPasswordEvent extends LoginEvent {}

class ShowUsernameEvent extends LoginEvent {}

class ShowPasswordEvent extends LoginEvent {}
