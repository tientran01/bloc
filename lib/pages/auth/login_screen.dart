import 'package:bloc_demo/bloc/login/bloc/login_event.dart';
import 'package:bloc_demo/bloc/login/bloc/login_bloc.dart';
import 'package:bloc_demo/bloc/login/bloc/login_state.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/component/custom_text_field.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:bloc_demo/resource/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(builder: (_, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(Constants.login,
                      style: TextStyle(fontSize: 25.0, color: Colors.black)),
                  SizedBox(height: Constants.size30),
                  CustomTextField(
                      type: TextFieldType.email,
                      title: Constants.email,
                      hintText: Constants.emailInput,
                      suffixIcon: const Icon(Icons.email),
                      onChanged: (String email) => getIt.get<LoginBloc>().add(
                          GetEmailAndPasswordFormTextFieldEvent(email: email))),
                  CustomTextField(
                      title: Constants.password,
                      type: TextFieldType.password,
                      hintText: Constants.passwordInput,
                      onChanged: (String password) => getIt
                          .get<LoginBloc>()
                          .add(GetEmailAndPasswordFormTextFieldEvent(
                              password: password))),
                  SizedBox(height: Constants.size30),
                  CustomButton(
                    text: Constants.login,
                    onTap: () => getIt
                        .get<LoginBloc>()
                        .add(SubmitLoginWithFirebaseEvent()),
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
                              .copyWith(color: Colors.amber.shade800),
                        ),
                      )
                    ],
                  )
                ]),
          ),
        );
      }),
    );
  }
}
