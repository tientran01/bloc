import 'package:bloc_demo/bloc/foget_password/bloc/forget_password_bloc.dart';
import 'package:bloc_demo/bloc/foget_password/bloc/forget_password_event.dart';
import 'package:bloc_demo/component/custom_app_bar.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/component/custom_text_field.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/app_color.dart';
import 'package:bloc_demo/resource/app_resource.dart';
import 'package:bloc_demo/resource/app_style.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/foget_password/bloc/forget_password_state.dart';

class InputEmailResetScreen extends StatelessWidget {
  const InputEmailResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIconPath: AppResource.leftArrow,
      ),
      body: BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
        builder: (_, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    Constants.forgetPassword,
                    style: AppStyle.header.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: Constants.size30),
                CustomTextField(
                  type: TextFieldType.email,
                  title: Constants.email,
                  hintText: Constants.emailInput,
                  suffixIcon: const Icon(Icons.email),
                  onChanged: (String email) {
                    getIt.get<ForgetPasswordBloc>().add(
                          GetEmailAndCheckValidEvent(email: email),
                        );
                  },
                ),
                SizedBox(height: Constants.size30),
                CustomButton(
                  text: Constants.send,
                  bgColor: AppColor.hFF9F29,
                  onTap: () => getIt.get<ForgetPasswordBloc>().add(SendEmailEvent()),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
