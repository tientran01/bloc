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
    on<VerifySentOtpEvent>(_onVerifySentOtp);
    on<VerificationCompletedEvent>(_loginWithCredential);
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
    try {
      FirebaseHelper.shared.verifyPhoneNumber(
        phoneNumber: state.phoneNumber ?? "",
        onVerificationCompleted: (AuthCredential authCredential) async {
          add(VerificationCompletedEvent(credential: authCredential));
        },
        onVerificationFailed: (FirebaseAuthException error) {
          add(VerificationFailedEvent(error: error.code));
        },
        onCodeSent: (verificationID, resentToken) {
          add(PhoneOtpSendEvent(
              verificationId: state.verificationId, token: state.token));
        },
        onCodeAutoRetrievalTimeout: (verificationID) {},
      );
    } catch (e) {
      add(VerificationFailedEvent(error: e.toString()));
    }
  }

  Future<void> _onVerifySentOtp(
    VerifySentOtpEvent event,
    Emitter<void> emitter,
  ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: event.verificationId ?? "",
        smsCode: event.otpCode ?? "",
      );
      add(VerificationCompletedEvent(credential: credential));
    } catch (e) {
      VerificationFailedEvent(error: e.toString());
    }
  }

  Future<void> _loginWithCredential(
    VerificationCompletedEvent event,
    Emitter<void> emitter,
  ) async {
    try {
      await FirebaseHelper.shared.auth
          .signInWithCredential(event.credential)
          .then(
        (user) {
          if (user.user != null) {
            NavigationService.navigatorKey.currentState
                ?.pushNamed("/phone_otp");
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      emitter(VerificationFailedEvent(error: e.code));
    } catch (e) {
      emitter(VerificationFailedEvent(error: e.toString()));
    }
  }

  static PhoneAuthBloc of(BuildContext context) =>
      BlocProvider.of<PhoneAuthBloc>(context);
}
