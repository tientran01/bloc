import 'package:bloc_demo/bloc/home/bloc/home_bloc.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:bloc_demo/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/login/bloc/login_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_)=> HomeBloc())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: RouteName.route
    );
  }
}
