import 'package:bloc_demo/bloc/login/bloc/login_event.dart';
import 'package:bloc_demo/bloc/login/bloc/login_bloc.dart';
import 'package:bloc_demo/bloc/login/bloc/login_state.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/component/custom_text_field.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/app_string.dart';
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
                  const Text(AppString.login,
                      style: TextStyle(fontSize: 25.0, color: Colors.black)),
                  const SizedBox(height: 30.0),
                  CustomTextField(
                      type: TextFieldType.email,
                      title: AppString.email,
                      hintText: AppString.emailInput,
                      suffixIcon: const Icon(Icons.email),
                      onChanged: (String email) => getIt
                          .get<LoginBloc>()
                          .add(GetEmailAndPasswordFormTextFieldEvent(
                              email: email))),
                  CustomTextField(
                      title: AppString.password,
                      type: TextFieldType.password,
                      hintText: AppString.passwordInput,
                      onChanged: (String password) => getIt
                          .get<LoginBloc>()
                          .add(GetEmailAndPasswordFormTextFieldEvent(
                              password: password))),
                  const SizedBox(height: 20.0),
                  CustomButton(
                    text: AppString.login,
                    onPressed: () => getIt
                        .get<LoginBloc>()
                        .add(SubmitLoginWithFirebaseEvent()),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.noAccount,
                        style: AppStyle.title,
                      ),
                      GestureDetector(
                        onTap: () => getIt.get<LoginBloc>().add(ClickRegisterEvent()),
                        child: Text(
                          AppString.register,
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
