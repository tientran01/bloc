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
import 'package:flutter/material.dart';

class RouteName {
  static Map<String, WidgetBuilder> route = {
    "/": (BuildContext context) => const SplashScreen(),
    "/login": (BuildContext context) => const LoginScreen(),
    "/sign_up": (BuildContext context) => const SignUpScreen(),
    "/home": (BuildContext context) => const HomeScreen(),
    "/profile": (BuildContext context) => const ProfileScreen(),
    "/demo_cubit": (BuildContext context) => const DemoCubitScreen(),
    "/demo_getx": (BuildContext context) => const DemoGetxScreen(),
    "/show_information": (BuildContext context) => const ShowInformationScreen(),
    "/phone_input": (BuildContext context) => const PhoneInputScreen(),
    "/phone_otp": (BuildContext context) => const PhoneOTPScreen()
  };
}
