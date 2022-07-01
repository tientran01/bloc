import 'package:bloc_demo/bloc/phone_auth/bloc/phone_auth_bloc.dart';
import 'package:bloc_demo/bloc/phone_auth/bloc/phone_auth_event.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/component/custom_otp_field.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/app_color.dart';
import 'package:bloc_demo/resource/app_style.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/phone_auth/bloc/phone_auth_state.dart';

class PhoneOTPScreen extends StatelessWidget {
  const PhoneOTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.verifyPhone),
      ),
      body: BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
        builder: (_, state) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: Constants.size30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Constants.requestInputOTP,
                  style: AppStyle.title,
                ),
                SizedBox(height: Constants.size30),
                Container(
                  alignment: Alignment.center,
                  child: CustomOTPField(
                    onChanged: (String otpCode) => getIt
                        .get<PhoneAuthBloc>()
                        .add(VerifySentOtpEvent(otpCode: otpCode)),
                  ),
                ),
                SizedBox(
                  height: Constants.size30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Constants.sendOTPfail,
                      style: AppStyle.title,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        Constants.requestAgain,
                        style: AppStyle.title.copyWith(
                          color: AppColor.hFF9F29,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: Constants.size30),
                CustomButton(
                  text: Constants.signUp,
                  bgColor: AppColor.h413F42,
                  onTap: () => getIt.get<PhoneAuthBloc>().add(
                        VerifySentOtpEvent(otpCode: state.otpCode),
                      ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
