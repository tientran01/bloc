import 'package:firebase_auth/firebase_auth.dart';

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

  Future<void> verifyPhoneNumber(
      {required String phoneNumber,
      required onVerificationCompleted,
      required onVerificationFailed,
      required onCodeSent,
      required onCodeAutoRetrievalTimeout}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+84 $phoneNumber",
      verificationCompleted: onVerificationCompleted,
      verificationFailed: onVerificationFailed,
      codeSent: onCodeSent,
      codeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
