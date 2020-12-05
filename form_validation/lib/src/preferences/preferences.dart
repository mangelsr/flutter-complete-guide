import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final String _tokenKey = 'token';
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  String get token {
    try {
      return _prefs.getString(_tokenKey);
    } catch (e) {
      return '';
    }
  }

  set token(String value) {
    _prefs.setString(_tokenKey, value);
  }
}
