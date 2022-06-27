import 'package:bloc_demo/bloc/login/bloc/login_event.dart';
import 'package:bloc_demo/bloc/login/bloc/login_state.dart';
import 'package:bloc_demo/repositories/api_client.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initState()) {
    on<GetUsernameAndPasswordFormTextFieldEvent>(
        _onGetUsernameAndPasswordFormTextField);
    on<SubmitLoginEvent>(_onSubmitLogin);
  }

  Future<void> _onGetUsernameAndPasswordFormTextField(
      GetUsernameAndPasswordFormTextFieldEvent event,
      Emitter<void> emit) async {
    emit(state.copyWith(
      username: event.username ?? state.username,
      password: event.password ?? state.password,
    ));
  }

  Future<void> _onSubmitLogin(
      SubmitLoginEvent event, Emitter<void> emitter) async {
    try {
      ApiClient.api.login(state.username, state.password);
      NavigationService.navigatorKey.currentState?.pushNamed("/home");
    } catch (e) {
      Text(e.toString());
    }
  }

  static LoginBloc of(BuildContext context) =>
      BlocProvider.of<LoginBloc>(context);
}
