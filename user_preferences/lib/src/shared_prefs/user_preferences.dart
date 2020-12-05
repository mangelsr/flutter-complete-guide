import 'package:shared_preferences/shared_preferences.dart';

import 'package:user_preferences/src/page/home_page.dart';

class UserPreferences {
  static final String _genereKey = 'genere';
  static final String _nameKey = 'name';
  static final String _secondaryColorKey = 'secondary';
  static final String _lastPageKey = 'last';
  late SharedPreferences _prefs;
  static final UserPreferences _instance = UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  int get genere {
    try {
      return _prefs.getInt(_genereKey);
    } catch (e) {
      return 1;
    }
  }

  set genere(int value) {
    _prefs.setInt(_genereKey, value);
  }

  bool get secondaryColor {
    try {
      return _prefs.getBool(_secondaryColorKey);
    } catch (e) {
      return false;
    }
  }

  set secondaryColor(bool value) {
    _prefs.setBool(_secondaryColorKey, value);
  }

  String get name {
    try {
      return _prefs.getString(_nameKey);
    } catch (e) {
      return '';
    }
  }

  set name(String value) {
    _prefs.setString(_nameKey, value);
  }

  String get lastPage {
    try {
      return _prefs.getString(_lastPageKey);
    } catch (e) {
      return HomePage.routeName;
    }
  }

  set lastPage(String value) {
    _prefs.setString(_lastPageKey, value);
  }
}
