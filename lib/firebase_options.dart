// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLpijfRRJalbWTSEAn4rEevvuJRzFHChc',
    appId: '1:897238353079:android:c8f3c98f7b4ea5feb57932',
    messagingSenderId: '897238353079',
    projectId: 'intern-7b018',
    storageBucket: 'intern-7b018.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCL2X7HMFAKqTEeNg6deUGNsZuYY17zByQ',
    appId: '1:897238353079:ios:6a64c14ab0f2823cb57932',
    messagingSenderId: '897238353079',
    projectId: 'intern-7b018',
    storageBucket: 'intern-7b018.appspot.com',
    iosClientId: '897238353079-or729qo6i7o8bopj433o05ibnckb7rli.apps.googleusercontent.com',
    iosBundleId: 'com.tomosia.internship',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCL2X7HMFAKqTEeNg6deUGNsZuYY17zByQ',
    appId: '1:897238353079:ios:6a64c14ab0f2823cb57932',
    messagingSenderId: '897238353079',
    projectId: 'intern-7b018',
    storageBucket: 'intern-7b018.appspot.com',
    iosClientId: '897238353079-or729qo6i7o8bopj433o05ibnckb7rli.apps.googleusercontent.com',
    iosBundleId: 'com.tomosia.internship',
  );
}