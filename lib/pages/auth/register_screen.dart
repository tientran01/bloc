import 'package:bloc_demo/bloc/register/bloc/register_bloc.dart';
import 'package:bloc_demo/bloc/register/bloc/register_event.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/component/custom_text_field.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/app_string.dart';
import 'package:bloc_demo/resource/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/register/bloc/register_state.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegisterBloc, RegisterState>(builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppString.register,
                style: AppStyle.header,
              ),
              const SizedBox(height: 30.0),
              CustomTextField(
                type: TextFieldType.email,
                title: AppString.email,
                hintText: AppString.emailInput,
                suffixIcon: const Icon(Icons.email),
                onChanged: (String email) => getIt.get<RegisterBloc>().add(
                    GetEmailAndPasswordFormTextFieldEvent(email: email)),
              ),
              CustomTextField(
                type: TextFieldType.password,
                title: AppString.password,
                hintText: AppString.usernameInput,
                onChanged: (String password) => getIt.get<RegisterBloc>().add(
                    GetEmailAndPasswordFormTextFieldEvent(
                        password: password)),
              ),
              const SizedBox(height: 30.0),
              CustomButton(
                text: AppString.register,
                onPressed: () => getIt.get<RegisterBloc>().add(CreateNewAccountEvent()),
              ),
            ],
          ),
        );
      }),
    );
  }
}
