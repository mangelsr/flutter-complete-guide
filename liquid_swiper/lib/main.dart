import 'package:flutter/material.dart';
import 'package:liquid_swiper/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Liquid Swiper',
      home: HomePage(),
    );
  }
}
