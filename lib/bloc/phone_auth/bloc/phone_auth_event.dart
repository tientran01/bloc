import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class PhoneAuthEvent extends Equatable {
  const PhoneAuthEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetPhoneFromFieldAndValidateEvent extends PhoneAuthEvent {
  final String? phoneNumber;
  const GetPhoneFromFieldAndValidateEvent({this.phoneNumber});
  @override
  List<Object?> get props => [phoneNumber];
}

//nhap sdt, otp gui qua sms
class SendOtpToPhoneAuthEvent extends PhoneAuthEvent {
  final String? phoneNumber;
  const SendOtpToPhoneAuthEvent({this.phoneNumber});
  @override
  List<Object?> get props => [phoneNumber];
}

//khi nhap otp, bat dau xac thuc
class VerifySentOtpEvent extends PhoneAuthEvent {
  final String? otpCode;
  final String? verificationId;

  const VerifySentOtpEvent({this.otpCode, this.verificationId});

  @override
  List<Object?> get props => [otpCode, verificationId];
}

//xac thuc otp thanh cong
class VerificationCompletedEvent extends PhoneAuthEvent {
  final AuthCredential credential;
  const VerificationCompletedEvent({required this.credential});
  @override
  List<Object?> get props => [credential];
}

//xac thuc otp fail
class VerificationFailedEvent extends PhoneAuthEvent {
  final String? error;
  const VerificationFailedEvent({this.error});
  @override
  List<Object?> get props => [error];
}

//yeu cau gui ma otp lai
class PhoneOtpSendEvent extends PhoneAuthEvent {
  final String? verificationId;
  final int? token;
  const PhoneOtpSendEvent({this.verificationId, this.token});
  @override
  List<Object?> get props => [verificationId];
}
