import 'package:equatable/equatable.dart';
import '../../../model/data.dart';

class HomeState extends Equatable {
  final List<Data>? datas;
  const HomeState({this.datas});
  const HomeState.initState() : this();
  HomeState copyWith({List<Data>? datas}) {
    return HomeState(
      datas: datas ?? this.datas
    );
  }

  @override
  List<Object?> get props => [datas];
}
