import 'package:bloc_demo/bloc/demo/bloc/demo_bloc.dart';
import 'package:bloc_demo/bloc/foget_password/bloc/forget_password_bloc.dart';
import 'package:bloc_demo/bloc/home/bloc/home_bloc.dart';
import 'package:bloc_demo/bloc/information/bloc/information_bloc.dart';
import 'package:bloc_demo/bloc/notification/bloc/notification_bloc.dart';
import 'package:bloc_demo/bloc/phone_auth/bloc/phone_auth_bloc.dart';
import 'package:bloc_demo/bloc/sign_up/bloc/sign_up_bloc.dart';
import 'package:bloc_demo/bloc/splash/bloc/splash_bloc.dart';
import 'package:bloc_demo/bloc/verify_otp_bloc/bloc/verify_otp_bloc.dart';
import 'package:bloc_demo/cubit/demo/demo_cubit.dart';
import 'package:bloc_demo/helper/firebase_helper.dart';
import 'package:bloc_demo/helper/shared_preferences_helper.dart';
import 'package:bloc_demo/modules/bloc_module.dart';
import 'package:bloc_demo/resource/app_route_name.dart';
import 'package:bloc_demo/resource/app_strings.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:bloc_demo/router/router_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'bloc/login/bloc/login_bloc.dart';
import 'helper/notification_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationService.shared.init();
  BlocModule.provider();
  SharedPreferencesHelper.shared.setUpSharedPreferences();
  FirebaseHelper.shared.registerNotification();
  FirebaseHelper.shared.getToken();
  FirebaseHelper.shared.setupInteractedMessage();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashBloc()),
        BlocProvider(create: (_) => DemoBloc()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => SignUpBloc()),
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => InformationBloc()),
        BlocProvider(create: (_) => DemoCubit()),
        BlocProvider(create: (_) => PhoneAuthBloc()),
        BlocProvider(create: (_) => VerifyOtpBloc()),
        BlocProvider(create: (_) => ForgetPasswordBloc()),
        BlocProvider(create: (_) => NotificationBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    String appBadgeSupported;
    try {
      bool res = await FlutterAppBadger.isAppBadgeSupported();
      if (res) {
        appBadgeSupported = AppStrings.supported;
      } else {
        appBadgeSupported = AppStrings.notSupported;
      }
    } on PlatformException {
      appBadgeSupported = AppStrings.failedSupport;
    }
    if (!mounted) return;

    setState(() {
      appBadgeSupported;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteName.splash,
      routes: RouteName.route,
      builder: EasyLoading.init(),
    );
  }
}
