import 'package:bloc_demo/bloc/verify_otp_bloc/bloc/verify_otp_event.dart';
import 'package:bloc_demo/bloc/verify_otp_bloc/bloc/verify_otp_state.dart';
import 'package:bloc_demo/helper/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  VerifyOtpBloc() : super(const VerifyOtpState.initState()) {
    on<ResendOtpCodeEvent>(_onResendOtpCode);
  }

  Future<void> _onResendOtpCode(
      ResendOtpCodeEvent event, Emitter<void> emitter) async {
    FirebaseHelper.shared.verifyPhoneNumber(
      phoneNumber: event.phoneNumber ?? '',
      onVerificationCompleted: (AuthCredential authCredential) async {},
      onVerificationFailed: (FirebaseAuthException error) {},
      onCodeSent: (String? verificationID, int? resentToken) {
        print(verificationID);
        print(resentToken);
      },
      onCodeAutoRetrievalTimeout: (verificationID) {},
    );
  }

  static VerifyOtpBloc of(BuildContext context) =>
      BlocProvider.of<VerifyOtpBloc>(context);
}
