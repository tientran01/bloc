import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class GetEmailAndPasswordFormTextFieldEvent extends LoginEvent {
  final String? email;
  final String? password;
  const GetEmailAndPasswordFormTextFieldEvent({
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

class SubmitLoginEvent extends LoginEvent {}

class SubmitLoginWithFirebaseEvent extends LoginEvent {}

class ClickSignUpEvent extends LoginEvent {}
