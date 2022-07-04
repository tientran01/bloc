import 'package:equatable/equatable.dart';

class VerifyOtpState extends Equatable {
  final String? phoneNumber;
  const VerifyOtpState({this.phoneNumber});
  const VerifyOtpState.initState() : this();

  VerifyOtpState copyWith({String? phoneNumber}) {
    return VerifyOtpState(
      phoneNumber: phoneNumber
    );
  }

  @override
  List<Object?> get props => [phoneNumber];
}
