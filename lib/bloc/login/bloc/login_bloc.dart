import 'package:bloc_demo/bloc/login/bloc/login_event.dart';
import 'package:bloc_demo/bloc/login/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initState()) {
    on<GetUsernameAndPasswordFormTextFieldEvent>(
        _onGetUsernameAndPasswordFormTextField);
    on<ShowUserNameAndPasswordEvent>(_onShowUserNameAndPassword);
  }

  Future<void> _onShowUserNameAndPassword(
      ShowUserNameAndPasswordEvent event, Emitter<void> emitter) async {
    emit(state.copyWith(
        nameAndPassword: '${state.username} and ${state.password}'));
  }

  Future<void> _onGetDataFromTextField(
      GetDataFromTextFieldEvent event, Emitter<void> emitter) async {
    print(event.value);
    emit(state.copyWith(isLoading: event.value));
  }

  Future<void> _onGetUsernameAndPasswordFormTextField(
      GetUsernameAndPasswordFormTextFieldEvent event,
      Emitter<void> emitter) async {
    print(event.username);
    print(event.password);
    emit(state.copyWith(
      username: event.username ?? state.username,
      password: event.password ?? state.password,
    ));
  }


  static LoginBloc of(BuildContext context) =>
      BlocProvider.of<LoginBloc>(context);
}
