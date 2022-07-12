import 'package:bloc_demo/component/custom_app_bar.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/helper/notification_service.dart';
import 'package:bloc_demo/resource/app_route_name.dart';
import 'package:bloc_demo/resource/app_strings.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.notification,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.size20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: AppStrings.showLocalNotification,
              onTap: () {
                NotificationService.shared.showNotification(
                  id: 0,
                  title: AppStrings.localNotificationTitle,
                  body: AppStrings.localNotificationBody,
                );
              },
            ),
            SizedBox(height: Constants.size20),
            CustomButton(
              text: AppStrings.showScheduledNotification,
              onTap: () {
                NotificationService.shared.showScheduledNotification(
                  id: 1,
                  title: AppStrings.localNotificationTitle,
                  body: AppStrings.localNotificationBody,
                );
              },
            ),
            SizedBox(height: Constants.size20),
            CustomButton(
              text: AppStrings.showNotificationWithPayload,
              onTap: () {
                NotificationService.shared.showNotificationWithPayload(
                  id: 2,
                  title: AppStrings.localNotificationTitle,
                  body: AppStrings.localNotificationBody,
                  payload: AppRouteName.home,
                );
              },
            ),
            SizedBox(height: Constants.size20),
            CustomButton(
              text: AppStrings.showPushNotification,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
