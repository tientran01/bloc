import 'package:bloc_demo/bloc/splash/bloc/splash_bloc.dart';
import 'package:bloc_demo/bloc/splash/bloc/splash_event.dart';
import 'package:bloc_demo/bloc/splash/bloc/splash_state.dart';
import 'package:bloc_demo/resource/app_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocBuilder<SplashBloc, SplashState>(
        builder: (_, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppResource.pandaIcon,
                  scale: 2.5,
                ),
                const SizedBox(height: 30.0),
                const CircularProgressIndicator(
                  color: Colors.amber,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
