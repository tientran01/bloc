import 'package:equatable/equatable.dart';

abstract class InformationEvent extends Equatable {
  const InformationEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ClickButtonSignOutEvent extends InformationEvent {}
