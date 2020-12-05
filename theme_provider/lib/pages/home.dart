import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:theme_provider/blocs/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
      ),
      body: ButtonList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => theme.theme = ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.lime,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.lime,
            )),
      ),
    );
  }
}

class ButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text('Ligth'),
          onPressed: () {
            theme.theme = ThemeData.light();
          },
        ),
        FlatButton(
          child: Text('Dark'),
          onPressed: () {
            theme.theme = ThemeData.dark();
          },
        ),
      ],
    );
  }
}
