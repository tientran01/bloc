import 'package:bloc_demo/resource/app_style.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomOTPField extends StatelessWidget {
  const CustomOTPField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinput(
      defaultPinTheme: AppStyle.appStyle.defaultPinTheme,
    );
  }
  
}
