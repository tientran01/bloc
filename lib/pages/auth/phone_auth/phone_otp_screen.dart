import 'dart:async';
import 'package:bloc_demo/bloc/verify_otp_bloc/bloc/verify_otp_bloc.dart';
import 'package:bloc_demo/bloc/verify_otp_bloc/bloc/verify_otp_event.dart';
import 'package:bloc_demo/bloc/verify_otp_bloc/bloc/verify_otp_state.dart';
import 'package:bloc_demo/component/custom_button.dart';
import 'package:bloc_demo/component/custom_otp_field.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/app_color.dart';
import 'package:bloc_demo/resource/app_style.dart';
import 'package:bloc_demo/resource/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneOTPScreen extends StatefulWidget {
  const PhoneOTPScreen({Key? key}) : super(key: key);

  @override
  State<PhoneOTPScreen> createState() => _PhoneOTPScreenState();
}

class _PhoneOTPScreenState extends State<PhoneOTPScreen> {
  final pinController = TextEditingController();
  int max = 30;
  String? time;
  bool ignoring = false;
  Timer? timer;
  @override
  void initState() {
    setStatus(!ignoring);
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      print(timer.tick);
      if (timer.tick >= max) {
        setState(() {
          time = '00:00';
        });
        timer.cancel();
        setStatus(!ignoring);
      } else {
        setState(() {
          time = '${((max - timer.tick) ~/ 60).toString().padLeft(2, '0')}:'
              '${((max - timer.tick) % 60).toString().padLeft(2, '0')}';
        });
      }
    });
  }

  void setStatus(bool newValue) {
    setState(() {
      ignoring = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // String phoneNumber = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.verifyPhone),
      ),
      body: BlocBuilder<VerifyOtpBloc, VerifyOtpState>(
        builder: (_, state) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: Constants.size30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   "${Constants.phoneGetOtp} $phoneNumber",
                //   style: AppStyle.title,
                // ),
                SizedBox(height: Constants.size30),
                Container(
                  alignment: Alignment.center,
                  child: CustomOTPField(
                    textEditingController: pinController,
                    onChanged: (String otpCode) {
                      getIt.get<VerifyOtpBloc>().add(
                            GetOtpFormFieldEvent(otpCode: otpCode),
                          );
                    },
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
                    IgnorePointer(
                      ignoring: ignoring,
                      child: GestureDetector(
                        onTap: () {
                          pinController.clear();
                          getIt.get<VerifyOtpBloc>().add(ResendOtpCodeEvent());
                          startTimer();
                        },
                        child: Text(
                          Constants.requestAgain,
                          style: AppStyle.title.copyWith(
                            color: !ignoring
                                ? AppColor.hFF9F29
                                : AppColor.borderOTPColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: Constants.size30),
                CustomButton(
                  text: Constants.signUp,
                  bgColor: AppColor.h413F42,
                  onTap: () => getIt
                      .get<VerifyOtpBloc>()
                      .add(SignUpWithPhoneNumberEvent()),
                ),
                SizedBox(height: Constants.size30),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Send OTP again in ", style: AppStyle.title),
                  TextSpan(
                      text: time,
                      style: AppStyle.title.copyWith(color: Colors.red)),
                  TextSpan(text: " sec", style: AppStyle.title)
                ]))
              ],
            ),
          );
        },
      ),
    );
  }
}
