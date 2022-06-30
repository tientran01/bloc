import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneState extends Equatable {
  final String? phoneNumber;
  final AuthCredential? credential;
  final String? error;
  const PhoneState({this.phoneNumber, this.credential, this.error});

  const PhoneState.initState() : this();

  PhoneState copyWith({
    String? phoneNumber,
    AuthCredential? credential,
    String? error,
  }) {
    return PhoneState(
      phoneNumber: phoneNumber,
      credential: credential,
      error: error,
    );
  }

  @override
  List<Object?> get props => [phoneNumber, credential, error];
}
