import 'package:flutter/material.dart';

import 'package:mapbox_map/src/pages/fullscreenmap.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapbox Map',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FullScreenMap()
      ),
    );
  }
}