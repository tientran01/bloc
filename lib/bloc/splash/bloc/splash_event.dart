import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {
   const SplashEvent();
  @override
  List<Object?> get props => [];
}

class LoginEvent extends SplashEvent {
  final String? uid;
  const LoginEvent({this.uid});
  @override
  List<Object?> get props => [uid];
}
