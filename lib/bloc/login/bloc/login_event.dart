import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class GetUsernameAndPasswordFormTextFieldEvent extends LoginEvent {
  final String? username;
  final String? password;
  const GetUsernameAndPasswordFormTextFieldEvent({this.username,this.password,});

  @override
  List<Object?> get props => [username,password,];
}

class SubmitLoginEvent extends LoginEvent {}