import 'package:equatable/equatable.dart';

abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();
  @override
  List<Object?> get props => [];
}

class LoadApiEvent extends RestaurantEvent {}

class GetDataFromTextFieldEvent extends RestaurantEvent {
  final String? value;

  const GetDataFromTextFieldEvent({this.value});

  @override
  List<Object?> get props => [value];
}

class GetPasswordFromTextFieldEvent extends RestaurantEvent {
  final String? password;
  const GetPasswordFromTextFieldEvent(this.password);
  @override
  List<Object?> get props => [password];
}


class ShowUserNameAndPasswordEvent extends RestaurantEvent {}
