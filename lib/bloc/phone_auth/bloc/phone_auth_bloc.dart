import 'package:bloc_demo/bloc/phone_auth/bloc/phone_auth_event.dart';
import 'package:bloc_demo/bloc/phone_auth/bloc/phone_auth_state.dart';
import 'package:bloc_demo/helper/firebase_helper.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneAuthBloc extends Bloc<PhoneAuthEvent, PhoneAuthState> {
  PhoneAuthBloc() : super(const PhoneAuthState.initState()) {
    on<GetPhoneFromFieldAndValidateEvent>(_onGetPhoneFromFieldAndValidate);
    on<SendOtpToPhoneAuthEvent>(_onSendOtpPhoneNumber);
    on<VerificationFailedEvent>(_onVerificationFailed);
    on<VerifySentOtpEvent>(_onVerifySentOtp);
    on<LoginWithPhoneNumberEvent>(_onLoginWithPhoneNumber);
  }
  Future<void> _onGetPhoneFromFieldAndValidate(
    GetPhoneFromFieldAndValidateEvent event,
    Emitter<void> emitter,
  ) async {
    emitter(state.copyWith(phoneNumber: event.phoneNumber ?? ""));
  }

  Future<void> _onSendOtpPhoneNumber(
    SendOtpToPhoneAuthEvent event,
    Emitter<PhoneAuthState> emitter,
  ) async {
    FirebaseHelper.shared.verifyPhoneNumber(
      phoneNumber: state.phoneNumber ?? "",
      onVerificationCompleted: (AuthCredential authCredential) async {},
      onVerificationFailed: (FirebaseAuthException error) {
        add(VerificationFailedEvent(error: error.code));
      },
      onCodeSent: (String? verificationID, int? resentToken) {
        NavigationService.navigatorKey.currentState?.pushNamed("/phone_otp", arguments: state.phoneNumber ?? event.phoneNumber);
      },
      onCodeAutoRetrievalTimeout: (verificationID) {},
    );
  }

  Future<void> _onVerifySentOtp(
      VerifySentOtpEvent event, Emitter<void> emitter) async {
    emitter(state.copyWith(otpCode: event.otpCode ?? ""));
  }

  Future<void> _onVerificationFailed(
    VerificationFailedEvent event,
    Emitter<void> emitter,
  ) async {}

  Future<void> _onLoginWithPhoneNumber(
      LoginWithPhoneNumberEvent event, Emitter<void> emitter) async {
    FirebaseHelper.shared.loginWithPhoneNumber(state.otpCode);
  }

  static PhoneAuthBloc of(BuildContext context) =>
      BlocProvider.of<PhoneAuthBloc>(context);
}
