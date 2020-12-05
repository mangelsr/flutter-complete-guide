import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:beats_app/pages/home_page.dart';
import 'package:beats_app/providers/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ProductsProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Beats App',
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}
