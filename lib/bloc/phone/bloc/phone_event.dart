import 'package:bloc_demo/helper/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class PhoneEvent extends Equatable {
  const PhoneEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SendOtpToPhoneEvent extends PhoneEvent {
  final String? phoneNumber;
  final VerificationCompletedEvent? verificationCompletedEvent;
  const SendOtpToPhoneEvent({this.phoneNumber, this.verificationCompletedEvent});
  @override
  List<Object?> get props => [phoneNumber];
}

class VerificationCompletedEvent extends PhoneEvent {
  final String? credential;
  const VerificationCompletedEvent({this.credential});
  @override
  List<Object?> get props => [credential];
}

class VerificationFailedEvent extends PhoneEvent {
  final FirebaseExceptionType? type;
  const VerificationFailedEvent({this.type});
  @override
  List<Object?> get props => [type];
}

class CodeSentEvent extends PhoneEvent {}

class CodeAutoRetrievalTimeoutEvent extends PhoneEvent {}
