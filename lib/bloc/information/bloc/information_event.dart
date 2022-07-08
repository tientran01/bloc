import 'package:equatable/equatable.dart';

abstract class InformationEvent extends Equatable {
  const InformationEvent();
  @override
  List<Object?> get props => [];
}

class SignOutEvent extends InformationEvent {}
