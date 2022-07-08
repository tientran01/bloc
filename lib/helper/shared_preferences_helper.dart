import 'package:bloc_demo/resource/app_route_name.dart';
import 'package:bloc_demo/router/navigation_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../resource/app_key_name.dart';

class SharedPreferencesHelper {
  static SharedPreferencesHelper shared = SharedPreferencesHelper._internal();
  SharedPreferencesHelper._internal();
  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();

  login(String uid) async {
    var prefs = await sharedPreferences;
    prefs.setString(AppKeyName.uid, uid);
  }

  autoLogin() async {
    var prefs = await sharedPreferences;
    prefs.getString(AppKeyName.uid);
  }

  checkLogin({String? uid}) async {
    var prefs = await sharedPreferences;
    uid = prefs.getString(AppKeyName.uid);
    if (uid != null) {
      Future.delayed(const Duration(seconds: 2)).then(
        (value) => NavigationService.navigatorKey.currentState
            ?.pushNamed(AppRouteName.home),
      );
    } else {
      Future.delayed(const Duration(seconds: 2)).then(
        (value) => NavigationService.navigatorKey.currentState
            ?.pushNamed(AppRouteName.login),
      );
    }
  }

  logout() async {
    var prefs = await sharedPreferences;
    prefs.remove(AppKeyName.uid);
  }
}
