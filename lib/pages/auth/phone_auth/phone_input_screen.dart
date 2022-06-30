import 'package:bloc_demo/bloc/phone/bloc/phone_bloc.dart';
import 'package:bloc_demo/bloc/phone/bloc/phone_event.dart';
import 'package:bloc_demo/component/custom_text_field.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/app_color.dart';
import 'package:bloc_demo/resource/app_resource.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/phone/bloc/phone_state.dart';

class PhoneInputScreen extends StatelessWidget {
  const PhoneInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.signUp),
      ),
      body: BlocBuilder<PhoneBloc, PhoneState>(builder: (_, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: Constants.size30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                keyboardType: TextInputType.phone,
                hintText: Constants.phoneInput,
                suffixIcon: InkWell(
                  onTap: () =>
                      getIt.get<PhoneBloc>().add(const SendOtpToPhoneEvent()),
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
      }),
    );
  }
}
