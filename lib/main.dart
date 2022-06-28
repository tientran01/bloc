import 'package:bloc_demo/bloc/home/bloc/home_bloc.dart';
import 'package:bloc_demo/cubit/demo/demo_cubit.dart';
import 'package:bloc_demo/pages/help.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:bloc_demo/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'bloc/login/bloc/login_bloc.dart';

GetIt getIt = GetIt.instance;
void main() {
  getIt.registerLazySingleton<LoginBloc>(() => LoginBloc());
  getIt.registerLazySingleton<Help>(() => Help());
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => HomeBloc()),
      BlocProvider(create: (_) => LoginBloc()),
      BlocProvider(create: (_) => DemoCubit())],
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
      initialRoute: "/home",
      routes: RouteName.route,
    );
  }
}
