import 'package:bloc_demo/bloc/splash/bloc/splash_bloc.dart';
import 'package:bloc_demo/bloc/splash/bloc/splash_event.dart';
import 'package:bloc_demo/helper/shared_preferences_helper.dart';
import 'package:bloc_demo/resource/app_color.dart';
import 'package:bloc_demo/resource/app_key_name.dart';
import 'package:bloc_demo/resource/app_style.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart';
import '../../../resource/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashBloc splashBloc;

  @override
  void initState() {
    splashBloc = SplashBloc.of(context);
    super.initState();
    print('--------${SharedPreferencesHelper.shared.getUid()}');
    print('=====${SharedPreferencesHelper.shared.prefs!.getString(AppKeyName.uid)}');
    splashBloc.add(const LoginEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.splashScreen,
              style: AppStyle.title,
            ),
            SizedBox(height: Constants.size10),
            const CircularProgressIndicator(
              color: AppColor.h413F42,
            )
          ],
        ),
      ),
    );
  }
}
