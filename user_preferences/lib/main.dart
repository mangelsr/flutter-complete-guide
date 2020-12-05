import 'package:flutter/material.dart';

import 'package:user_preferences/src/page/home_page.dart';
import 'package:user_preferences/src/page/settings_page.dart';
import 'package:user_preferences/src/shared_prefs/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = UserPreferences();
    return MaterialApp(
      title: 'Preferences',
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
