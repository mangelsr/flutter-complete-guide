import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  set tabIndex(int tabIndex) {
    _tabIndex = tabIndex;
    notifyListeners();
  }
}
