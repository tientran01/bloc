import 'package:bloc_demo/pages/auth/forget_password/check_email_screen.dart';
import 'package:bloc_demo/pages/auth/forget_password/input_email_reset_screen.dart';
import 'package:bloc_demo/pages/auth/forget_password/create_new_password_screen.dart';
import 'package:bloc_demo/pages/auth/phone_auth/phone_input_screen.dart';
import 'package:bloc_demo/pages/auth/phone_auth/phone_otp_screen.dart';
import 'package:bloc_demo/pages/auth/sign_up_screen.dart';
import 'package:bloc_demo/pages/chat/chat_screen.dart';
import 'package:bloc_demo/pages/demo/demo_bloc_screen.dart';
import 'package:bloc_demo/pages/auth/show_information_screen.dart';
import 'package:bloc_demo/pages/auth/login_screen.dart';
import 'package:bloc_demo/pages/demo/demo_cubit_screen.dart';
import 'package:bloc_demo/pages/demo/demo_getx_screen.dart';
import 'package:bloc_demo/pages/home/home_screen.dart';
import 'package:bloc_demo/pages/home/show_user_screen.dart';
import 'package:bloc_demo/pages/auth/profile_screen.dart';
import 'package:bloc_demo/pages/auth/splash/splash_screen.dart';
import 'package:bloc_demo/pages/main_screen.dart';
import 'package:bloc_demo/pages/product/detail_product_screen.dart';
import 'package:bloc_demo/pages/shopping/shopping_screen.dart';
import 'package:bloc_demo/resource/app_route_name.dart';
import 'package:flutter/material.dart';

class RouteName {
  static Map<String, WidgetBuilder> route = {
    AppRouteName.splash: (BuildContext context) => const SplashScreen(),
    AppRouteName.login: (BuildContext context) => const LoginScreen(),
    AppRouteName.signUp: (BuildContext context) =>  SignUpScreen(),
    AppRouteName.main: (BuildContext context) => const MainScreen(),
    AppRouteName.home: (BuildContext context) => const HomeScreen(),
    AppRouteName.demoBloc: (BuildContext context) => const DemoBlocScreen(),
    AppRouteName.profile: (BuildContext context) => const ProfileScreen(),
    AppRouteName.demoCubit: (BuildContext context) => const DemoCubitScreen(),
    AppRouteName.demoGetX: (BuildContext context) => const DemoGetxScreen(),
    AppRouteName.showInformation: (BuildContext context) =>
        const ShowInformationScreen(),
    AppRouteName.phoneInput: (BuildContext context) => const PhoneInputScreen(),
    AppRouteName.phoneOtp: (BuildContext context) => const PhoneOTPScreen(),
    AppRouteName.inputEmailReset: (BuildContext context) => const InputEmailResetScreen(),
    AppRouteName.createNewPassword: (BuildContext context) => const CreateNewPasswordScreen(),
    AppRouteName.checkEmail: (BuildContext context) => const CheckEmailScreen(),
    AppRouteName.showUser: (BuildContext context) => const ShowUserScreen(),
    AppRouteName.chat: (BuildContext context) => const ChatScreen(),
    AppRouteName.shopping: (BuildContext context) => const ShoppingScreen(),
    AppRouteName.detaiProduct: (BuildContext context) => const DetailProductScreen()
  };
}
