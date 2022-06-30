import 'package:bloc_demo/bloc/phone/bloc/phone_event.dart';
import 'package:bloc_demo/bloc/phone/bloc/phone_state.dart';
import 'package:bloc_demo/helper/firebase_helper.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneBloc extends Bloc<PhoneEvent, PhoneState> {
  PhoneBloc() : super(const PhoneState.initState()) {
    on<SendOtpToPhoneEvent>(_onSendOtpPhoneNumber);
    on<VerificationCompletedEvent>(_onVerificationCompleted);
    on<VerificationFailedEvent>(_onVerificationFailed);
    on<CodeSentEvent>(_onCodeSent);
    on<CodeAutoRetrievalTimeoutEvent>(_onCodeAutoRetrievalTimeout);
  }

  Future<void> _onSendOtpPhoneNumber(
      SendOtpToPhoneEvent event, Emitter<PhoneState> emitter) async {
    try {
      FirebaseHelper.shared.verifyPhoneNumber(
          phoneNumber: event.phoneNumber ?? state.phoneNumber);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _onVerificationCompleted(
      VerificationCompletedEvent event, Emitter<void> emitter) async {}

  Future<void> _onVerificationFailed(
      VerificationFailedEvent event, Emitter<void> emitter) async {}

  Future<void> _onCodeSent(CodeSentEvent event, Emitter<void> emitter) async {}

  Future<void> _onCodeAutoRetrievalTimeout(
      CodeAutoRetrievalTimeoutEvent event, Emitter<void> emitter) async {}

  static PhoneBloc of(BuildContext context) =>
      BlocProvider.of<PhoneBloc>(context);
}
