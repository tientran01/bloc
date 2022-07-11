import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeState extends Equatable {
  final User? user;
  const HomeState({this.user});
  const HomeState.initState() : this();
  HomeState copyWith({
    User? user,
  }) {
    return HomeState(
      user: user,
    );
  }

  @override
  List<Object?> get props => [user];
}
