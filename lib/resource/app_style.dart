import 'package:bloc_demo/resource/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class AppStyle {
  static AppStyle appStyle = AppStyle._internal();
  AppStyle._internal();
  static TextStyle header = const TextStyle(
    fontSize: 30.0,
  );
  static TextStyle title = const TextStyle(
    fontSize: 18.0,
    color: Colors.black,
  );

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: GoogleFonts.poppins(
      fontSize: 22,
      color: AppColor.h413F42,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(
        color: AppColor.borderOTPColor,
      ),
    ),
  );
}
