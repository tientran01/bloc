import 'package:bloc_demo/pages/demo_cubit_screen.dart';
import 'package:bloc_demo/pages/demo_getx_screen.dart';
import 'package:bloc_demo/pages/home.dart';
import 'package:bloc_demo/pages/information/input_information_screen.dart';
import 'package:bloc_demo/pages/information/show_information_screen.dart';
import 'package:bloc_demo/pages/login.dart';
import 'package:bloc_demo/pages/profile.dart';
import 'package:flutter/material.dart';

class RouteName {
  static Map<String, WidgetBuilder> route = {
    "/": (BuildContext context) => const LoginScreen(),
    "/home": (BuildContext context) => const HomeScreen(),
    "/profile": (BuildContext context) => const ProfileScreen(),
    "/demo_cubit": (BuildContext context) => const DemoCubitScreen(),
    "/demo_getx": (BuildContext context) => const DemoGetxScreen(),
    "/input_information": (BuildContext context) => const InputInformationScreen(),
    "/show_information": (BuildContext context) => const ShowInformationScreen()
  };
}
