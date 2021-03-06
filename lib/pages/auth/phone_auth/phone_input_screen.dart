import 'package:bloc_demo/component/custom_app_bar.dart';
import 'package:bloc_demo/component/custom_text_field.dart';
import 'package:bloc_demo/resource/app_color.dart';
import 'package:bloc_demo/resource/app_resource.dart';
import 'package:bloc_demo/resource/app_strings.dart';
import 'package:bloc_demo/resource/app_style.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/phone_auth/bloc/phone_auth_bloc.dart';
import '../../../bloc/phone_auth/bloc/phone_auth_event.dart';
import '../../../bloc/phone_auth/bloc/phone_auth_state.dart';
import '../../../main.dart';

class PhoneInputScreen extends StatelessWidget {
  const PhoneInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
        builder: (_, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: Constants.size30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.signInWithPhoneNumber.toUpperCase(),
                  style: AppStyle.header.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Constants.size30),
                CustomTextField(
                  type: TextFieldType.phoneNumber,
                  hintText: AppStrings.phoneInput,
                  onChanged: (String phoneNumber) =>
                      getIt.get<PhoneAuthBloc>().add(
                            GetPhoneFromFieldAndValidateEvent(
                                phoneNumber: phoneNumber),
                          ),
                  suffixIcon: InkWell(
                    onTap: () => getIt.get<PhoneAuthBloc>().add(
                          SendOtpToPhoneAuthEvent(
                            phoneNumber: state.phoneNumber,
                          ),
                        ),
                    customBorder: const CircleBorder(),
                    splashColor: AppColor.h413F42,
                    child: Image.asset(
                      AppResource.sendIcon,
                      width: 10.0,
                      height: 10.0,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
