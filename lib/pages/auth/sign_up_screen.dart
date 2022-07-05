import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/component/custom_divider.dart';
import 'package:bloc_demo/component/custom_social_button.dart';
import 'package:bloc_demo/component/custom_text_field.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/app_color.dart';
import 'package:bloc_demo/resource/app_resource.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:bloc_demo/resource/app_style.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/sign_up/bloc/sign_up_bloc.dart';
import '../../bloc/sign_up/bloc/sign_up_event.dart';
import '../../bloc/sign_up/bloc/sign_up_state.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (_, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                  type: TextFieldType.password,
                  title: Constants.password,
                  hintText: Constants.usernameInput,
                  onChanged: (String password) => getIt.get<SignUpBloc>().add(
                        GetEmailAndPasswordFormTextFieldEvent(
                            password: password),
                      ),
                ),
                SizedBox(height: Constants.size30),
                CustomButton(
                  text: Constants.signUp,
                  onTap: () =>
                      getIt.get<SignUpBloc>().add(CreateNewAccountEvent()),
                ),
                SizedBox(height: Constants.size30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Constants.haveAccount,
                      style: AppStyle.title.copyWith(color: AppColor.h413F42),
                    ),
                    GestureDetector(
                      onTap: () => NavigationService.navigatorKey.currentState
                          ?.pushNamed("/login"),
                      child: Text(
                        Constants.login,
                        style: AppStyle.title.copyWith(color: AppColor.hFF9F29),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Constants.size30,
                ),
                const CustomDivider(
                  textDisplay: Constants.or,
                  isOr: true,
                ),
                SizedBox(height: Constants.size30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocialButton(
                      socialIconPath: AppResource.phoneIcon,
                      onTap: () => getIt
                          .get<SignUpBloc>()
                          .add(SignUpWithPhoneNumberEvent()),
                    ),
                    SizedBox(width: Constants.size10),
                    CustomSocialButton(
                      socialIconPath: AppResource.facebookIcon,
                      onTap: () {},
                    ),
                    SizedBox(width: Constants.size10),
                    CustomSocialButton(
                      socialIconPath: AppResource.googleIcon,
                      onTap: () {},
                    ),
                    SizedBox(width: Constants.size10),
                    CustomSocialButton(
                      socialIconPath: AppResource.twitterIcon,
                      onTap: () {},
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
