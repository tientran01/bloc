import 'dart:math';

import 'package:bloc_demo/home/bloc/restaurant_event.dart';
import 'package:bloc_demo/home/bloc/restaurant_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc() : super(const RestaurantState.initState()) {
    on<LoadApiEvent>(_onFetchData);
    on<GetDataFromTextFieldEvent>(_onGetDataFromTextField);
    on<GetPasswordFromTextFieldEvent>(_onGetPasswordFromTextField);
    on<ShowUserNameAndPasswordEvent>(_onShowUserNameAndPassword);
  }

  Future<void> _onShowUserNameAndPassword(
      ShowUserNameAndPasswordEvent event, Emitter<void> emitter) async {
    emit(state.copyWith(nameAndPassword: state.password));
  }

  Future<void> _onGetDataFromTextField(
      GetDataFromTextFieldEvent event, Emitter<void> emitter) async {
    print(event.value);
    emit(state.copyWith(isLoading: event.value));
  }

  Future<void> _onGetPasswordFromTextField(
      GetPasswordFromTextFieldEvent event, Emitter<void> emitter) async {
    print(event.password);
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onFetchData(LoadApiEvent event, Emitter<void> emitter) async {
    emit(state.copyWith(isLoading: 'hihsjdfhjsdhjfhsjdf'));
  }

  static RestaurantBloc of(BuildContext context) =>
      BlocProvider.of<RestaurantBloc>(context);
}
