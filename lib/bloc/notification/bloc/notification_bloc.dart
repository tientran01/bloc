import 'package:bloc_demo/bloc/notification/bloc/notification_event.dart';
import 'package:bloc_demo/bloc/notification/bloc/notification_state.dart';
import 'package:bloc_demo/helper/shared_preferences_helper.dart';
import 'package:bloc_demo/resource/app_key_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState.initState()) {
    on<UpdateNotificationEvent>(_onUpdateNotification);
    on<GetTotalNotificationEvent>(_onGetTotalNotification);
  }
  Future<void> _onUpdateNotification(
      UpdateNotificationEvent event, Emitter<void> emitter) async {
    int bage = SharedPreferencesHelper.shared.getInt(AppKeyName.bageCount);
    int? bageCount = (event.count ?? 0) + bage;
    emitter(state.copyWith(count: bageCount));
    SharedPreferencesHelper.shared
        .setInt(AppKeyName.bageCount, bageCount);
  }

  Future<void> _onGetTotalNotification(
      GetTotalNotificationEvent event, Emitter<void> emitter) async {
    emitter(
      state.copyWith(totalNotification: state.count),
    );
  }

  static NotificationBloc of(BuildContext context) =>
      BlocProvider.of<NotificationBloc>(context);
}
