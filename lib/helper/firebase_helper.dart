import 'package:bloc_demo/bloc/phone/bloc/phone_bloc.dart';
import 'package:bloc_demo/helper/enum.dart';
import 'package:bloc_demo/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../bloc/phone/bloc/phone_event.dart';

class FirebaseHelper {
  static final FirebaseHelper shared = FirebaseHelper._internal();
  FirebaseHelper._internal();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login({String? email, String? password}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email ?? "", password: password ?? "");
  }

  Future<void> signUp({String? email, String? password}) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email ?? "", password: password ?? "");
  }

  Future<void> verifyPhoneNumber({
    String? phoneNumber,
  }) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber ?? "",
      verificationCompleted: _onVerificationCompleted,
      verificationFailed: _onVerificationFailed,
      codeSent: _onCodeSent,
      codeAutoRetrievalTimeout: _onCodeAutoRetrievalTimeout,
    );
  }

  Future<void> _onVerificationCompleted(PhoneAuthCredential credential) async {}

  _onVerificationFailed(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-phone-number':
        getIt.get<PhoneBloc>().add(
            const VerificationFailedEvent(type: FirebaseExceptionType.invalid));
        break;
      case 'network-request-failed':
        getIt.get<PhoneBloc>().add(
            const VerificationFailedEvent(type: FirebaseExceptionType.network));
        break;
      case 'too-many-requests':
        getIt.get<PhoneBloc>().add(
              const VerificationFailedEvent(
                  type: FirebaseExceptionType.request),
            );
        break;
      case 'quota-exceeded':
        getIt.get<PhoneBloc>().add(
              const VerificationFailedEvent(
                  type: FirebaseExceptionType.exceeded),
            );
        break;
      default:
        return null;
    }
  }

  _onCodeSent(String verificationId, int? resendToken) {}

  _onCodeAutoRetrievalTimeout(String verificationId) {}

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
