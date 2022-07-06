// ignore_for_file: avoid_print
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  static final FirebaseHelper shared = FirebaseHelper._internal();
  FirebaseHelper._internal();
  String? verificationId;
  int? resendToken;
  late PhoneAuthCredential phoneAuthCredential;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> loginWithEmailAndPassword(
      {String? email, String? password}) async {
    User? user;
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email ?? "",
      password: password ?? "",
    );
    user = userCredential.user;
    return user;
  }

  Future<User?> signUpWithEmailAndPassword(
      {String? email, String? password}) async {
    User? user;
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email ?? "",
      password: password ?? "",
    );
    user = userCredential.user;
    return user;
  }

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required onVerificationCompleted,
    required onVerificationFailed,
    required onCodeSent,
    required onCodeAutoRetrievalTimeout,
  }) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+84 $phoneNumber",
      timeout: const Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential authCredential) {
        phoneAuthCredential = authCredential;
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationID, int? resendCode) {
        verificationId = verificationID;
        resendToken = resendCode;
        onCodeSent(verificationID, resendCode);
      },
      forceResendingToken: resendToken,
      codeAutoRetrievalTimeout: (String verificationID) {
        verificationId = verificationID;
        print("Timeout");
      },
    );
  }

  Future<void> loginWithPhoneNumber(
    String? smsCode,
  ) async {
    phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verificationId ?? '',
      smsCode: smsCode ?? '',
    );
    try {
      var result =
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      print(result.user);
      if (result.user != null) {
        NavigationService.navigatorKey.currentState
            ?.pushNamed("/show_information");
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
    } catch (e) {
      print('error${e.toString()}');
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> resetPasswordWithEmail({String? email}) async {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email ?? "");
  }
}
