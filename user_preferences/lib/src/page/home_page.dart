import 'package:flutter/material.dart';

import 'package:user_preferences/src/shared_prefs/user_preferences.dart';
import 'package:user_preferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Preferences'),
          backgroundColor: prefs.secondaryColor ? Colors.teal : Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Secondary color: ${prefs.secondaryColor}'),
            Divider(),
            Text('Genere: ${prefs.genere}'),
            Divider(),
            Text('Username: ${prefs.name}'),
          ],
        ),
        drawer: MenuWidget(),
      ),
    );
  }
}
