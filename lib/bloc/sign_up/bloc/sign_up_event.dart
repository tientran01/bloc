import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetEmailAndPasswordFormTextFieldEvent extends SignUpEvent {
  final String? email;
  final String? password;
  GetEmailAndPasswordFormTextFieldEvent({this.email, this.password});
  @override
  List<Object?> get props => [email, password];
}

class CreateNewAccountEvent extends SignUpEvent {
  final String? email;
  final String? password;
  CreateNewAccountEvent({this.email, this.password});
  @override
  List<Object?> get props => [email, password];
}

class ShowEvent extends SignUpEvent {
  final String? email;
  final String? password;
  ShowEvent({this.email, this.password});
  @override
  List<Object?> get props => [email, password];
}

class SignUpWithPhoneNumberEvent extends SignUpEvent {}

class SignUpWithGoogleEvent extends SignUpEvent {}

class SignUpWithTwitterEvent extends SignUpEvent {}

class SignUpWithFacebookEvent extends SignUpEvent {}