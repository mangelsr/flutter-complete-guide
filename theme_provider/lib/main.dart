import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/blocs/theme.dart';
import 'package:theme_provider/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Provider',
      home: HomePage(),
      theme: theme.theme,
    );
  }
}
