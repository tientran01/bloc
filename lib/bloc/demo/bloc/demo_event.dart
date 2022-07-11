import 'package:equatable/equatable.dart';
import '../../../model/data.dart';

abstract class DemoEvent extends Equatable {
  const DemoEvent();
  @override
  List<Object?> get props => [];
}

class GetDataByIdEvent extends DemoEvent {
  final Data? data;
  const GetDataByIdEvent({this.data});
  @override
  List<Object?> get props => [data];
}

class GetDataByUserIdEvent extends DemoEvent {
  final Data? data;
  const GetDataByUserIdEvent({this.data});
  @override
  List<Object?> get props => [data];
}

class ClickButtonDemoCubitEvent extends DemoEvent {}

class ClickButtonDemoGetXEvent extends DemoEvent {}