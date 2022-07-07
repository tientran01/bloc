import 'package:bloc_demo/bloc/splash/bloc/splash_bloc.dart';
import 'package:bloc_demo/bloc/splash/bloc/splash_event.dart';
import 'package:bloc_demo/resource/app_color.dart';
import 'package:bloc_demo/resource/app_style.dart';
import 'package:flutter/material.dart';

import '../../../resource/constants.dart';

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
    splashBloc.add(AutoNavigationToLoginEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Constants.splashScreen, style: AppStyle.title,),
          SizedBox(height: Constants.size10),
          const CircularProgressIndicator(
            color: AppColor.h413F42,
          )
        ],
      ),
    ));
  }
}