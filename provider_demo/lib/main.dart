import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:provider_demo/pages/home_page.dart';
import 'package:provider_demo/providers/heros_info.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (BuildContext context) => HeroInfo(),
      child: MaterialApp(
        title: 'Provider Demo',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}
