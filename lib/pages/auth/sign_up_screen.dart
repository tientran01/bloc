import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/component/custom_text_field.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:bloc_demo/resource/app_style.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/sign_up/bloc/sign_up_bloc.dart';
import '../../bloc/sign_up/bloc/sign_up_event.dart';
import '../../bloc/sign_up/bloc/sign_up_state.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (_, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Constants.signUp,
                    style: AppStyle.header,
                  ),
                  SizedBox(height: Constants.size30),
                  CustomTextField(
                    type: TextFieldType.email,
                    title: Constants.email,
                    hintText: Constants.emailInput,
                    suffixIcon: const Icon(Icons.email),
                    onChanged: (String email) => getIt.get<SignUpBloc>().add(
                          GetEmailAndPasswordFormTextFieldEvent(email: email),
                        ),
                  ),
                  SizedBox(height: Constants.size10),
                  CustomTextField(
                    textEditingController: passwordController,
                    type: TextFieldType.password,
                    title: Constants.password,
                    hintText: Constants.usernameInput,
                    onChanged: (String password) => getIt.get<SignUpBloc>().add(
                          GetEmailAndPasswordFormTextFieldEvent(
                            password: password,
                          ),
                        ),
                  ),
                  SizedBox(height: Constants.size30),
                  CustomButton(
                    text: Constants.signUp,
                    onTap: () {
                      trySignUp();
                    },
                  ),
                  SizedBox(height: Constants.size30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Constants.haveAccount,
                        style: AppStyle.lightTitle,
                      ),
                      GestureDetector(
                        onTap: () => NavigationService.navigatorKey.currentState
                            ?.pushNamed("/login"),
                        child: Text(
                          Constants.login,
                          style: AppStyle.title,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void trySignUp() {
    if (_formKey.currentState!.validate()) {
      getIt.get<SignUpBloc>().add(CreateNewAccountEvent());
    } else {
      passwordController.clear();
    }
  }
}
