import 'package:bloc_demo/bloc/notification/bloc/notification_event.dart';
import 'package:bloc_demo/bloc/notification/bloc/notification_state.dart';
import 'package:bloc_demo/helper/shared_preferences_helper.dart';
import 'package:bloc_demo/resource/app_key_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState.initState()) {
    on<UpdateNotificationEvent>(_onUpdateNotification);
  }
  Future<void> _onUpdateNotification(
      UpdateNotificationEvent event, Emitter<void> emitter) async {
    emitter(state.copyWith(count: event.count));
    SharedPreferencesHelper.shared
        .setInt(AppKeyName.badgeCount, event.count ?? 0);
  }

  static NotificationBloc of(BuildContext context) =>
      BlocProvider.of<NotificationBloc>(context);
}
