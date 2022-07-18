// ignore_for_file: avoid_print
import 'package:bloc_demo/bloc/home/bloc/home_bloc.dart';
import 'package:bloc_demo/bloc/home/bloc/home_event.dart';
import 'package:bloc_demo/helper/error.dart';
import 'package:bloc_demo/helper/loading.dart';
import 'package:bloc_demo/helper/shared_preferences_helper.dart';
import 'package:bloc_demo/main.dart';
import 'package:bloc_demo/resource/app_key_name.dart';
import 'package:bloc_demo/resource/app_route_name.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
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
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  int number = 0;

  Future<User?> loginWithEmailAndPassword({
    String? email,
    String? password,
  }) async {
    User? user;
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email ?? "",
      password: password ?? "",
    );
    user = userCredential.user;
    return user;
  }

  Future<User?> signUpWithEmailAndPassword({
    String? email,
    String? password,
  }) async {
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
        NavigationService.navigatorKey.currentState?.pushNamed(
          AppRouteName.showUser,
          arguments: user,
        );
        SharedPreferencesHelper.shared.saveUid(user?.uid ?? "");
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
      Loading.showSuccess(AppStrings.success);
      facebookAuthCredential = FacebookAuthProvider.credential(
        loginResult.accessToken?.token ?? "",
      );
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      User? user = userCredential.user;
      if (user != null) {
        Loading.dismiss();
        NavigationService.navigatorKey.currentState?.pushNamed(
          AppRouteName.main,
          arguments: user,
        );
        SharedPreferencesHelper.shared.saveUid(user.uid);
        SharedPreferencesHelper.shared
            .setString(AppKeyName.displayName, user.displayName ?? "");
      } else {
        print(AppStrings.error);
      }
    }
  }

  Future<void> registerNotification() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print(AppStrings.grantedPermission);
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print(AppStrings.grantedProvisionalPermission);
    } else {
      print(AppStrings.notAcceptedPermission);
    }
  }

  Future<void> getToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print(fcmToken);
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      print(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        NavigationService.navigatorKey.currentState?.pushNamed(
          AppRouteName.notificationDetail,
          arguments: message,
        );
      },
    );

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        number++;
        print(number);
        addBadge(number);
        getIt.get<HomeBloc>().add(UpdateBadgeEvent(badgeCount: number));
      },
    );
  }

  void addBadge(int count) async {
    FlutterAppBadger.updateBadgeCount(count);
  }

  void removeBadge() {
    FlutterAppBadger.removeBadge();
    SharedPreferencesHelper.shared.prefs?.remove(AppKeyName.badgeCount);
  }
}
