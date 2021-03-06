import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class ShowProfileEvent extends HomeEvent {
  final User? user;
  const ShowProfileEvent({this.user});
  @override
  List<Object?> get props => [user];
}

class SignOutEvent extends HomeEvent {}
