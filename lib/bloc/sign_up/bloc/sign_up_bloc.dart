import 'package:bloc_demo/bloc/sign_up/bloc/sign_up_event.dart';
import 'package:bloc_demo/bloc/sign_up/bloc/sign_up_state.dart';
import 'package:bloc_demo/helper/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../router/navigation_service.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState.initState()) {
    on<GetEmailAndPasswordFormTextFieldEvent>(
        _onGetEmailAndPasswordFormTextField);
    on<CreateNewAccountEvent>(_onCreateNewAccount);
    on<ShowEvent>(_onShow);
    on<SignUpWithPhoneNumberEvent>(_onSignUpWithPhoneNumber);
  }

  Future<void> _onGetEmailAndPasswordFormTextField(
      GetEmailAndPasswordFormTextFieldEvent event,
      Emitter<void> emitter) async {
    emitter(state.copyWith(
        email: event.email ?? state.email,
        password: event.password ?? state.password));
  }

  Future<void> _onCreateNewAccount(
      CreateNewAccountEvent event, Emitter<void> emitter) async {
    try {
      FirebaseHelper.shared
          .signUp(
              email: event.email ?? state.email,
              password: event.password ?? state.password)
          .then((value) =>
              NavigationService.navigatorKey.currentState?.pushNamed('/home'));
    } on FirebaseAuthException catch (e) {
      Text(e.toString());
    }
  }

  Future<void> _onShow(ShowEvent event, Emitter<void> emitter) async {
    emitter(state.copyWith(
        email: state.email ?? event.email,
        password: state.password ?? event.password));
  }

  Future<void> _onSignUpWithPhoneNumber(
      SignUpWithPhoneNumberEvent event, Emitter<void> emitter) async {
    NavigationService.navigatorKey.currentState?.pushNamed("/phone_input");
  }

  static SignUpBloc of(BuildContext context) =>
      BlocProvider.of<SignUpBloc>(context);
}
