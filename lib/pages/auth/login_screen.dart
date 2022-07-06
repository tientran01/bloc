import 'package:bloc_demo/bloc/login/bloc/login_event.dart';
import 'package:bloc_demo/bloc/login/bloc/login_bloc.dart';
import 'package:bloc_demo/bloc/login/bloc/login_state.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/component/custom_text_field.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/app_color.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:bloc_demo/resource/app_style.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resource/app_route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (_, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      Constants.login,
                      style: TextStyle(fontSize: 25.0, color: Colors.black),
                    ),
                    SizedBox(height: Constants.size30),
                    CustomTextField(
                      textEditingController: emailController,
                      type: TextFieldType.email,
                      title: Constants.email,
                      hintText: Constants.emailInput,
                      suffixIcon: const Icon(Icons.email),
                      onChanged: (email) => getIt.get<LoginBloc>().add(
                            GetEmailAndPasswordFormTextFieldEvent(email: email),
                          ),
                    ),
                    SizedBox(height: Constants.size10),
                    CustomTextField(
                      textEditingController: passwordController,
                      title: Constants.password,
                      type: TextFieldType.password,
                      hintText: Constants.passwordInput,
                      onChanged: (String password) =>
                          getIt.get<LoginBloc>().add(
                                GetEmailAndPasswordFormTextFieldEvent(
                                    password: password),
                              ),
                    ),
                    buildForgetPassword(),
                    SizedBox(height: Constants.size30),
                    CustomButton(
                      text: Constants.login,
                      bgColor: AppColor.hE2703A,
                      onTap: () {
                        tryLogin();
                      },
                    ),
                    SizedBox(height: Constants.size30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Constants.noAccount,
                          style: AppStyle.title,
                        ),
                        GestureDetector(
                          onTap: () =>
                              getIt.get<LoginBloc>().add(ClickSignUpEvent()),
                          child: Text(
                            Constants.signUp,
                            style: AppStyle.title
                                .copyWith(color: AppColor.hE2703A),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Constants.size30),
                    const CustomButton(
                      text: Constants.signInWithGoogle,
                      bgColor: AppColor.hDDDDDD,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  //test01@gmail.com - 123456789
  void tryLogin() {
    if (_formKey.currentState!.validate()) {
      getIt.get<LoginBloc>().add(SubmitLoginWithFirebaseEvent());
    } else {
      showSnackBar(Constants.loginFail);
      passwordController.clear();
    }
  }

  void showSnackBar(String text) {
    final snackBar = SnackBar(
      content: Text(text),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget buildForgetPassword() {
    return GestureDetector(
      onTap: () => NavigationService.navigatorKey.currentState?.pushNamed(
        AppRouteName.inputEmailReset,
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 10.0, right: 10.0),
        alignment: Alignment.bottomRight,
        child: Text(
          Constants.forgetPassword,
          style: AppStyle.title.copyWith(
              fontSize: 16,
              decoration: TextDecoration.underline,
              color: AppColor.borderOTPColor),
        ),
      ),
    );
  }
}
