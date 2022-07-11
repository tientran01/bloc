import 'package:equatable/equatable.dart';
import '../../../model/data.dart';

class DemoState extends Equatable {
  final List<Data>? datas;
  const DemoState({this.datas});
  const DemoState.initState() : this();
  DemoState copyWith({List<Data>? datas}) {
    return DemoState(
      datas: datas ?? this.datas
    );
  }

  @override
  List<Object?> get props => [datas];
}
