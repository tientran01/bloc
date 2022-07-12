// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'dart:io';

import 'package:bloc_demo/resource/app_route_name.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:bloc_demo/resource/app_strings.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static NotificationService shared = NotificationService._internal();
  NotificationService._internal();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var dateTime = DateTime.now();
  Future<void> init() async {
    tz.initializeTimeZones();
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: null,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future<NotificationDetails> notificationDetails() async {
    NotificationDetails? notificationDetails;
    if (Platform.isIOS) {
      IOSNotificationDetails iOSNotificationDetails = IOSNotificationDetails();

      notificationDetails = NotificationDetails(iOS: iOSNotificationDetails);
    } else {
      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        AppStrings.channelId,
        AppStrings.channelName,
        channelDescription: AppStrings.channelDescription,
        importance: Importance.max,
        priority: Priority.high,
      );
      notificationDetails =
          NotificationDetails(android: androidNotificationDetails);
    }
    return notificationDetails;
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final detail = await notificationDetails();
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      detail,
    );
  }

  Future<void> showScheduledNotification({
    int? hour,
    int? minute,
    int? seconds,
    required int id,
    required String title,
    required String body,
  }) async {
    final detail = await notificationDetails();
    var dateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      getHour(hour ?? 0),
      getMinute(minute ?? 0),
      0,
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(dateTime, tz.local),
      detail,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> showNotificationWithPayload(
      {required int id,
      required String title,
      required String body,
      required String payload}) async {
    final detail = await notificationDetails();
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      detail,
      payload: payload,
    );
  }

  void onSelectNotification(String? payload) {
    NavigationService.navigatorKey.currentState
        ?.pushNamed(payload ?? AppRouteName.chat);
  }

  int getHour(int hour) {
    if (hour >= dateTime.hour) {
      return hour;
    }
    return dateTime.hour;
  }

  int getMinute(int minute) {
    if (minute >= dateTime.minute) {
      return minute;
    }
    return dateTime.minute + 2;
  }
}
