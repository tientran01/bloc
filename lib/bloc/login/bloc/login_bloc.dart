import 'package:bloc_demo/bloc/login/bloc/login_event.dart';
import 'package:bloc_demo/bloc/login/bloc/login_state.dart';
import 'package:bloc_demo/helper/firebase_helper.dart';
import 'package:bloc_demo/repositories/api_client.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initState()) {
    on<GetEmailAndPasswordFormTextFieldEvent>(
        _onGetEmailAndPasswordFormTextField);
    on<SubmitLoginEvent>(_onSubmitLogin);
    on<SubmitLoginWithFirebaseEvent>(_onSubmitLoginWithFirebase);
    on<ClickRegisterEvent>(_onClickRegister);
  }

  Future<void> _onGetEmailAndPasswordFormTextField(
      GetEmailAndPasswordFormTextFieldEvent event, Emitter<void> emit) async {
    emit(state.copyWith(
      email: event.email ?? state.email,
      password: event.password ?? state.password,
    ));
  }

  Future<void> _onSubmitLogin(
      SubmitLoginEvent event, Emitter<void> emitter) async {
    try {
      ApiClient.api.login(state.email, state.password).then((value) =>
          NavigationService.navigatorKey.currentState?.pushNamed("/home"));
    } catch (e) {
      Text(e.toString());
    }
  }

  Future<void> _onSubmitLoginWithFirebase(
      SubmitLoginWithFirebaseEvent event, Emitter<void> emitter) async {
    try {
      FirebaseHelper.shared.login(email: state.email, password: state.password);
      NavigationService.navigatorKey.currentState
          ?.pushNamed('/show_information');
    } on FirebaseAuthException catch (e) {
      Text(e.toString());
    }
  }

  Future<void> _onClickRegister(
      ClickRegisterEvent event, Emitter<void> emitter) async {
    NavigationService.navigatorKey.currentState?.pushNamed("/register");
  }

  static LoginBloc of(BuildContext context) =>
      BlocProvider.of<LoginBloc>(context);
}
