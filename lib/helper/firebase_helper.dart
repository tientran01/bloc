// ignore_for_file: avoid_print
import 'package:bloc_demo/helper/error.dart';
import 'package:bloc_demo/helper/loading.dart';
import 'package:bloc_demo/resource/app_route_name.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../resource/app_strings.dart';

class FirebaseHelper {
  static final FirebaseHelper shared = FirebaseHelper._internal();
  FirebaseHelper._internal();
  String? verificationId;
  int? resendToken;
  late PhoneAuthCredential phoneAuthCredential;
  late AuthCredential authCredential;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
      Loading.show(AppStrings.loading);
      var result =
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      print(result.user);
      if (result.user != null) {
        Loading.dismiss();
        NavigationService.navigatorKey.currentState
            ?.pushNamed(AppRouteName.showInformation);
      }
    } on FirebaseAuthException catch (e) {
      Loading.showError(AppStrings.error);
      print(e.code);
    } catch (e) {
      print('${AppStrings.error} ${e.toString()}');
    }
  }

  Future<void> signOut() async {
    _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }

  Future<void> resetPasswordWithEmail({String? email}) async {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email ?? "");
  }

  Future<User?> signInWithGoogle() async {
    User? user;
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    Loading.show(AppStrings.loading);
    if (googleUser != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      try {
        Loading.dismiss();
        final UserCredential userCredential =
            await auth.signInWithCredential(authCredential);
        user = userCredential.user;
        NavigationService.navigatorKey.currentState
            ?.pushNamed(AppRouteName.googleShowInformation, arguments: user);
      } on FirebaseException catch (e) {
        Loading.showError(AppStrings.error);
        if (e.code == Error.accountExist) {
          print(Error.accountExist);
        } else if (e.code == Error.invalidCredential) {
          print(Error.invalidCredential);
        }
      } catch (e) {
        print(e);
      }
    }
    return user;
  }

  Future signInWithFacebook() async {
    OAuthCredential facebookAuthCredential;
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      facebookAuthCredential = FacebookAuthProvider.credential(
        loginResult.accessToken?.token ?? "",
      );
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      User? user = userCredential.user;
      if (user != null) {
        print(user);
        NavigationService.navigatorKey.currentState?.pushNamed(
          AppRouteName.facebookShowInformation,
          arguments: user,
        );
      } else {
        print(AppStrings.error);
      }
    }
  }
}
