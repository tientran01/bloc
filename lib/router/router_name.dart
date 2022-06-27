import 'package:bloc_demo/pages/home.dart';
import 'package:bloc_demo/pages/login.dart';
import 'package:bloc_demo/pages/profile.dart';
import 'package:flutter/material.dart';

class RouteName {
  static Map<String, WidgetBuilder> route = {
    "/": (BuildContext context) => const LoginScreen(),
    "/home": (BuildContext context) => const HomeScreen(),
    "/profile": (BuildContext context) => const ProfileScreen()
  };
}
