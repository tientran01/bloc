import 'package:equatable/equatable.dart';

abstract class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent();
  @override
  List<Object?> get props => [];
}

class ResendOtpCodeEvent extends VerifyOtpEvent {
  final String? phoneNumber;
  const ResendOtpCodeEvent({this.phoneNumber});
  @override
  List<Object?> get props => [phoneNumber];
}
