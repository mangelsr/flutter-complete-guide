import 'package:flutter/material.dart';

class HeroInfo with ChangeNotifier {
  String _hero = 'Iron Man';
  Color _baseColor = Colors.blue;

  get hero => _hero;
  get baseColor => _baseColor;

  set hero(String name) {
    this._hero = name;
    this._baseColor = (name == 'Iron Man') ? Colors.red : Colors.green;
    notifyListeners();
  }
}
