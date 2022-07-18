import 'package:bloc_demo/component/custom_app_bar.dart';
import 'package:bloc_demo/helper/shared_preferences_helper.dart';
import 'package:bloc_demo/resource/app_color.dart';
import 'package:bloc_demo/resource/app_key_name.dart';
import 'package:bloc_demo/resource/app_resource.dart';
import 'package:bloc_demo/resource/app_strings.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationDetailScreen extends StatelessWidget {
  const NotificationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RemoteMessage? message =
        ModalRoute.of(context)?.settings.arguments as RemoteMessage;
    int countNotification =
        SharedPreferencesHelper.shared.getInt(AppKeyName.badgeCount);
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.notification,
      ),
      body: ListView.builder(
        itemCount: countNotification,
        itemBuilder: (context, index) {
          return buildNotificationItem(message);
        },
      ),
    );
  }

  Widget buildNotificationItem(RemoteMessage? message) => Card(
        color: AppColor.hDDDDDD,
        child: Container(
          width: double.infinity,
          height: 100,
          padding: EdgeInsets.symmetric(
            horizontal: Constants.size20,
            vertical: Constants.size10,
          ),
          child: Row(
            children: [
              Image.asset(AppResource.bugger_1),
              SizedBox(
                width: Constants.size30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message?.notification?.title ?? ""),
                  Text(message?.notification?.body ?? "")
                ],
              ),
            ],
          ),
        ),
      );
}
