import 'package:equatable/equatable.dart';

class PhoneAuthState extends Equatable {
  final String? phoneNumber;
  final String? error;
  final String? otpCode;
  final String? verificationId;
  final int? token;
  final bool? isPhoneValid;
  const PhoneAuthState(
      {this.phoneNumber,
      this.error,
      this.otpCode,
      this.verificationId,
      this.token,
      this.isPhoneValid});

  const PhoneAuthState.initState() : this();

  PhoneAuthState copyWith({
    String? phoneNumber,
    String? error,
    String? otpCode,
    String? verificationId,
    int? token,
    bool? isPhoneValid,
  }) {
    return PhoneAuthState(
      phoneNumber: phoneNumber,
      error: error,
      otpCode: otpCode,
      verificationId: verificationId,
      token: token,
      isPhoneValid: isPhoneValid,
    );
  }

  @override
  List<Object?> get props =>
      [phoneNumber, error, otpCode, verificationId, token, isPhoneValid];
}
