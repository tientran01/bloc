import 'package:bloc_demo/resource/app_style.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomOTPField extends StatelessWidget {
  final Function(String)? onChanged;
  const CustomOTPField({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinput(
      defaultPinTheme: AppStyle.appStyle.defaultPinTheme,
      length: 6,
      onChanged: onChanged,
    );
  }
}
