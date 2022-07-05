import 'package:bloc_demo/pages/auth/phone_auth/phone_input_screen.dart';
import 'package:bloc_demo/pages/auth/phone_auth/phone_otp_screen.dart';
import 'package:bloc_demo/pages/auth/sign_up_screen.dart';
import 'package:bloc_demo/pages/demo_cubit_screen.dart';
import 'package:bloc_demo/pages/demo_getx_screen.dart';
import 'package:bloc_demo/pages/home_screen.dart';
import 'package:bloc_demo/pages/auth/show_information_screen.dart';
import 'package:bloc_demo/pages/auth/login_screen.dart';
import 'package:bloc_demo/pages/profile_screen.dart';
import 'package:bloc_demo/pages/auth/splash_screen.dart';
import 'package:bloc_demo/resource/app_route_name.dart';
import 'package:flutter/material.dart';

class RouteName {
  static Map<String, WidgetBuilder> route = {
    AppRouteName.splash: (BuildContext context) => const SplashScreen(),
    AppRouteName.login: (BuildContext context) => const LoginScreen(),
    AppRouteName.signUp: (BuildContext context) => const SignUpScreen(),
    AppRouteName.home: (BuildContext context) => const HomeScreen(),
    AppRouteName.profile: (BuildContext context) => const ProfileScreen(),
    AppRouteName.demoCubit: (BuildContext context) => const DemoCubitScreen(),
    AppRouteName.demoGetX: (BuildContext context) => const DemoGetxScreen(),
    AppRouteName.showInformation: (BuildContext context) => const ShowInformationScreen(),
    AppRouteName.phoneInput: (BuildContext context) => const PhoneInputScreen(),
    AppRouteName.phoneOtp: (BuildContext context) => const PhoneOTPScreen(),

  };
}
