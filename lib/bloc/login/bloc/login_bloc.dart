import 'package:bloc_demo/bloc/login/bloc/login_event.dart';
import 'package:bloc_demo/bloc/login/bloc/login_state.dart';
import 'package:bloc_demo/helper/firebase_helper.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initState()) {
    on<GetEmailAndPasswordFormTextFieldEvent>(
        _onGetEmailAndPasswordFormTextField);
    on<SubmitLoginWithFirebaseEvent>(_onSubmitLoginWithFirebase);
    on<ClickSignUpEvent>(_onClickSignUp);
  }

  Future<void> _onGetEmailAndPasswordFormTextField(
      GetEmailAndPasswordFormTextFieldEvent event, Emitter<void> emit) async {
    emit(state.copyWith(
      email: event.email ?? state.email,
      password: event.password ?? state.password,
    ));
  }

  Future<User?> _onSubmitLoginWithFirebase(
      SubmitLoginWithFirebaseEvent event, Emitter<void> emitter) async {
    try {
      User? user = await FirebaseHelper.shared.login(
        email: state.email,
        password: state.password,
      );
      if (user != null) {
        NavigationService.navigatorKey.currentState
            ?.pushNamed("/show_information");
        return Future.value(user);
      }
      return Future.error("User is null after creating an account");
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message!);
    }
  }

  Future<void> _onClickSignUp(
      ClickSignUpEvent event, Emitter<void> emitter) async {
    NavigationService.navigatorKey.currentState?.pushNamed("/sign_up");
  }

  static LoginBloc of(BuildContext context) =>
      BlocProvider.of<LoginBloc>(context);

  // Future<void> _onSubmitLogin(
  //     SubmitLoginEvent event, Emitter<void> emitter) async {
  //   try {
  //     ApiClient.api.login(state.email, state.password).then((value) =>
  //         NavigationService.navigatorKey.currentState?.pushNamed("/home"));
  //   } catch (e) {
  //     Text(e.toString());
  //   }
  // }
}
