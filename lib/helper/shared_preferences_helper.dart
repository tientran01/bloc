import 'package:shared_preferences/shared_preferences.dart';
import '../resource/app_key_name.dart';

class SharedPreferencesHelper {
  static SharedPreferencesHelper shared = SharedPreferencesHelper._internal();
  SharedPreferencesHelper._internal();
 SharedPreferences? prefs;

  Future<void> setUpSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  saveUid(String uid) async {
    return await prefs!.setString(AppKeyName.uid, uid);
  }

  getUid({String? uid}) async{
    return uid = prefs!.getString(AppKeyName.uid);
  }

  logout() async {
    return prefs!.remove(AppKeyName.uid);
  }

  getString(String key) {
    return prefs!.getString(key);
  }

  setString(String key, String data) {
    return prefs!.setString(key, data);
  }

  getInt(String key) {
    return prefs!.getInt(key);
  }

  setInt(String key, int data) {
    return prefs!.setInt(key, data);
  }
}
