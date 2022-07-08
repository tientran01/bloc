import 'package:bloc_demo/bloc/splash/bloc/splash_event.dart';
import 'package:bloc_demo/bloc/splash/bloc/splash_state.dart';
import 'package:bloc_demo/helper/shared_preferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState.initstate()) {
    on<LoginEvent>(_onLogin);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<void> emitter) async {
    SharedPreferencesHelper.shared.checkLogin(uid: state.uid);
  }

  static SplashBloc of(BuildContext context) =>
      BlocProvider.of<SplashBloc>(context);
}
