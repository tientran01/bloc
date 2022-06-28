import 'package:bloc_demo/bloc/home/bloc/home_event.dart';
import 'package:bloc_demo/bloc/home/bloc/home_state.dart';
import 'package:bloc_demo/model/data.dart';
import 'package:bloc_demo/repositories/api_client.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initState()) {
    on<GetDataByIdEvent>(_onGetDataById);
    on<GetDataByUserIdEvent>(_onGetDataByUserId);
    on<ClickButtonDemoCubitEvent>(_onClickButtonDemoCubit);
    on<ClickButtonDemoGetXEvent>(_onClickButtonDemoGetX);
  }

  Future<void> _onGetDataById(
      GetDataByIdEvent event, Emitter<void> emitter) async {
    GetData datas = await ApiClient.api.getDataById(1);
    emitter(state.copyWith(datas: datas.datas));
    NavigationService.navigatorKey.currentState
        ?.pushNamed('/profile', arguments: datas.datas);
  }

  Future<void> _onGetDataByUserId(
      GetDataByUserIdEvent event, Emitter<void> emitter) async {
    GetData datas = await ApiClient.api.getDataByUserId(1);
    emitter(state.copyWith(datas: datas.datas));
    NavigationService.navigatorKey.currentState
        ?.pushNamed('/profile', arguments: datas.datas);
  }

  Future<void> _onClickButtonDemoCubit(
      ClickButtonDemoCubitEvent event, Emitter<void> emitter) async {
    NavigationService.navigatorKey.currentState?.pushNamed('/demo_cubit');
  }

  Future<void> _onClickButtonDemoGetX(
      ClickButtonDemoGetXEvent event, Emitter<void> emitter) async {
    NavigationService.navigatorKey.currentState?.pushNamed('/demo_getx');
  }

  static HomeBloc of(BuildContext context) =>
      BlocProvider.of<HomeBloc>(context);
}
