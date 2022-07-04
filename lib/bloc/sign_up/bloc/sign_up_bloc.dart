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
    on<SignUpWithPhoneNumberEvent>(_onSignUpWithPhoneNumber);
  }

  Future<void> _onGetEmailAndPasswordFormTextField(
      GetEmailAndPasswordFormTextFieldEvent event,
      Emitter<void> emitter) async {
    emitter(state.copyWith(
        email: event.email ?? state.email,
        password: event.password ?? state.password));
  }

  Future<User?> _onCreateNewAccount(
      CreateNewAccountEvent event, Emitter<void> emitter) async {
    try {
      User? user = await FirebaseHelper.shared.signUp(
        email: event.email ?? state.email,
        password: event.password ?? state.password,
      );
      if (user != null) {
        NavigationService.navigatorKey.currentState
            ?.pushNamed("/show_information");
        return Future.value(user);
      } return Future.error("User is null after creating an account");
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message!);
    }
  }

  Future<void> _onSignUpWithPhoneNumber(
      SignUpWithPhoneNumberEvent event, Emitter<void> emitter) async {
    NavigationService.navigatorKey.currentState?.pushNamed("/phone_input");
  }

  static SignUpBloc of(BuildContext context) =>
      BlocProvider.of<SignUpBloc>(context);
}
