import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  static final FirebaseHelper shared = FirebaseHelper._internal();
  FirebaseHelper._internal();
  Future<void> login({String? email, String? password}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email ?? "", password: password ?? "");
  }

  Future<void> signUp({String? email, String? password}) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email ?? "", password: password ?? "");
  }

  User? get currentUser {
   return FirebaseAuth.instance.currentUser;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
