import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  ThemeData get theme => this._themeData;

  set theme(ThemeData themeData) {
    this._themeData = themeData;
    notifyListeners();
  }
}
