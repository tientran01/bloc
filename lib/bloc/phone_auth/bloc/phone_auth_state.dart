import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthState extends Equatable {
  final String? phoneNumber;
  final AuthCredential? credential;
  final String? error;
  final String? otpCode;
  final String? verificationId;
  final int? token;
  const PhoneAuthState({
    this.phoneNumber,
    this.credential,
    this.error,
    this.otpCode,
    this.verificationId,
    this.token,
  });

  const PhoneAuthState.initState() : this();

  PhoneAuthState copyWith(
      {String? phoneNumber,
      AuthCredential? credential,
      String? error,
      String? otpCode,
      String? verificationId,
      int? token}) {
    return PhoneAuthState(
        phoneNumber: phoneNumber,
        credential: credential,
        error: error,
        otpCode: otpCode,
        verificationId: verificationId,
        token: token);
  }

  @override
  List<Object?> get props =>
      [phoneNumber, credential, error, otpCode, verificationId, token];
}
