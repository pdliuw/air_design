import 'package:shared_preferences/shared_preferences.dart';

///
/// SharedPreferencesManager
class SharedPreferencesManager {
  static const String KEY_TOKEN = "key_token";

  static SharedPreferencesManager _instance;

  static SharedPreferencesManager instance() {
    if (_instance == null) {
      _instance = SharedPreferencesManager();
    }
    return _instance;
  }

  Future<bool> saveToken({
    String fullToken,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(KEY_TOKEN, fullToken);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY_TOKEN);
  }

  Future<bool> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(KEY_TOKEN, "");
  }
}
