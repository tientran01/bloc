import 'package:bloc_demo/component/custom_app_bar.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/resource/app_route_name.dart';
import 'package:bloc_demo/resource/app_strings.dart';
import 'package:bloc_demo/resource/app_style.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:flutter/material.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.checkValidEmail,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.size30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.messCheckEmail.toUpperCase(),
                style: AppStyle.title,
              ),
              SizedBox(height: Constants.size30),
              CustomButton(
                text: AppStrings.login.toUpperCase(),
                onTap: () => NavigationService.navigatorKey.currentState
                    ?.pushNamed(AppRouteName.login),
              )
            ],
          ),
        ));
  }
}
