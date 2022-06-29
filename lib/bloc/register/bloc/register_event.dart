import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetEmailAndPasswordFormTextFieldEvent extends RegisterEvent {
  final String? email;
  final String? password;
  GetEmailAndPasswordFormTextFieldEvent({this.email, this.password});
  @override
  List<Object?> get props => [email, password];
}

class CreateNewAccountEvent extends RegisterEvent {
  final String? email;
  final String? password;
  CreateNewAccountEvent({this.email, this.password});
  @override
  List<Object?> get props => [email, password];
}

class ShowEvent extends RegisterEvent {
  final String? email;
  final String? password;
  ShowEvent({this.email, this.password});
  @override
  List<Object?> get props => [email, password];
}
