import 'package:bloc_demo/bloc/splash/bloc/splash_event.dart';
import 'package:bloc_demo/bloc/splash/bloc/splash_state.dart';
import 'package:bloc_demo/helper/shared_preferences_helper.dart';
import 'package:bloc_demo/resource/app_key_name.dart';
import 'package:bloc_demo/resource/app_route_name.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState.initstate()) {
    on<CheckLoginEvent>(_onCheckLogin);
  }

  Future<void> _onCheckLogin(
      CheckLoginEvent event, Emitter<void> emitter) async {
    if (SharedPreferencesHelper.shared.prefs!.getString(AppKeyName.uid) !=
        null) {
      Future.delayed(const Duration(seconds: 2)).then(
        (value) => NavigationService.navigatorKey.currentState
            ?.pushNamed(AppRouteName.main),
      );
    } else {
      Future.delayed(const Duration(seconds: 2)).then(
        (value) => NavigationService.navigatorKey.currentState
            ?.pushNamed(AppRouteName.login),
      );
    }
  }

  static SplashBloc of(BuildContext context) =>
      BlocProvider.of<SplashBloc>(context);
}
