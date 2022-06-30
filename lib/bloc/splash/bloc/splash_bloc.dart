import 'package:bloc_demo/bloc/splash/bloc/splash_event.dart';
import 'package:bloc_demo/bloc/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../router/navigation_service.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState.initstate()) {
    on<AutoNavigationToLoginEvent>(_onAutoNavigationToLogin);
  }

  Future<void> _onAutoNavigationToLogin(
      AutoNavigationToLoginEvent event, Emitter<void> emitter) async {
    // await Future.delayed(const Duration(seconds: 2), () {
    //   NavigationService.navigatorKey.currentState?.pushNamed('/login');
    // });
  }

  static SplashBloc of(BuildContext context) =>
      BlocProvider.of<SplashBloc>(context);
}
