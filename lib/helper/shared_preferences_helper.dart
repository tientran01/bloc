import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferencesHelper shared = SharedPreferencesHelper._internal();
  SharedPreferencesHelper._internal();
  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();

  void autoLoginWithEmailAndPassword(String email, String password) async {
    final SharedPreferences prefs = await sharedPreferences;
    prefs.setString("email", email);
    prefs.setString("password", password);
  }
}
