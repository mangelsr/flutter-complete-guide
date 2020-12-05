import 'package:flutter/material.dart';

import 'package:push_local/src/pages/home_page.dart';
import 'package:push_local/src/pages/message_page.dart';
import 'package:push_local/src/providers/push_notifications_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  PushNotificationProvider _provider = PushNotificationProvider();

  @override
  void initState() {
    _provider.initNotifications();
    _provider.messages.listen((String data) {
      navigatorKey.currentState!.pushNamed('message', arguments: data);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Push Local',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'message': (BuildContext context) => MessagePage(),
      },
    );
  }
}
