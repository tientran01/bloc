import 'package:bloc_demo/component/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../component/custom_button.dart';
import '../../../component/custom_text_field.dart';
import '../../../resource/app_color.dart';
import '../../../resource/app_resource.dart';
import '../../../resource/app_style.dart';
import '../../../resource/constants.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIconPath: AppResource.leftArrow,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                Constants.createNewPassword,
                style: AppStyle.header.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: Constants.size30),
            const CustomTextField(
              type: TextFieldType.password,
              title: Constants.password,
              hintText: Constants.passwordInput,
            ),
            SizedBox(height: Constants.size10),
            const CustomTextField(
              type: TextFieldType.password,
              title: Constants.confirmPassword,
              hintText: Constants.confirmPassword,
            ),
            SizedBox(height: Constants.size30),
            const CustomButton(
              text: Constants.resetPassword,
              bgColor: AppColor.hFF9F29,
            )
          ],
        ),
      ),
    );
  }
}