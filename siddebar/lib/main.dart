import 'package:flutter/material.dart';
import 'package:siddebar/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hidden Sidebar',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
