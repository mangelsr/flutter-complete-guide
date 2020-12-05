import 'package:flutter/material.dart';

import 'package:user_preferences/src/shared_prefs/user_preferences.dart';
import 'package:user_preferences/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late TextEditingController _controller;
  final UserPreferences prefs = UserPreferences();

  late bool _secondaryColor;
  late int _genere;
  late String _name;

  @override
  void initState() {
    prefs.lastPage = SettingsPage.routeName;
    _genere = prefs.genere;
    _secondaryColor = prefs.secondaryColor;
    _name = prefs.name;
    _controller = TextEditingController(text: _name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: prefs.secondaryColor ? Colors.teal : Colors.blue,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _secondaryColor,
              title: Text('Secondary color'),
              onChanged: _setSecondaryColor,
            ),
            RadioListTile(
              value: 1,
              title: Text('Male'),
              groupValue: _genere,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Female'),
              groupValue: _genere,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Username',
                  helperText: 'Person\'s name using phone',
                ),
                onChanged: _setName,
              ),
            )
          ],
        ),
      ),
      drawer: MenuWidget(),
    );
  }

  void _setSelectedRadio(int? value) {
    prefs.genere = value!;
    _genere = value;
    setState(() {});
  }

  void _setSecondaryColor(bool value) {
    prefs.secondaryColor = value;
    _secondaryColor = value;
    setState(() {});
  }

  void _setName(String value) {
    prefs.name = value;
    _name = value;
    setState(() {});
  }
}
