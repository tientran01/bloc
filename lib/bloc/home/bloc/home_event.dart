import 'package:equatable/equatable.dart';
import '../../../model/data.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class GetDataByIdEvent extends HomeEvent {
  final Data? data;
  const GetDataByIdEvent({this.data});
  @override
  List<Object?> get props => [data];
}

class GetDataByUserIdEvent extends HomeEvent {
  final Data? data;
  const GetDataByUserIdEvent({this.data});
  @override
  List<Object?> get props => [data];
}
