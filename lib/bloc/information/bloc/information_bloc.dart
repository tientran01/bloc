import 'package:bloc_demo/bloc/information/bloc/information_event.dart';
import 'package:bloc_demo/bloc/information/bloc/information_state.dart';
import 'package:bloc_demo/helper/firebase_helper.dart';
import 'package:bloc_demo/helper/shared_preferences_helper.dart';
import 'package:bloc_demo/resource/app_route_name.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  InformationBloc() : super(const InformationState.initState()) {
    on<SignOutEvent>(_onSignOut);
  }

  Future<void> _onSignOut(
    SignOutEvent event,
    Emitter<void> emitter,
  ) async {
    try {
      FirebaseHelper.shared.signOut().then(
            (value) => NavigationService.navigatorKey.currentState
                ?.pushNamed(AppRouteName.login),
          );
      SharedPreferencesHelper.shared.logout();
    } on FirebaseAuthException catch (e) {
      Text(e.toString());
    }
  }

  static InformationBloc of(BuildContext context) =>
      BlocProvider.of<InformationBloc>(context);
}
