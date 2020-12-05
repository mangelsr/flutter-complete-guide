import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _messagesStreamController = StreamController<String>.broadcast();

  Stream<String> get messages => _messagesStreamController.stream;

  dispose() {
    _messagesStreamController.close();
  }

  void initNotifications() async {
    _firebaseMessaging.requestNotificationPermissions();
    final String token = await _firebaseMessaging.getToken();
    print('===== FCM Token =====');
    print(token);
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> info) async {
        // Si la app esta abierta y en primer plano
        print('===== On Message =====');
        String arg = 'no-data';
        if (Platform.isAndroid) {
          arg = info['data']['comida'] ?? 'no-data';
        }
        _messagesStreamController.sink.add(arg);
      },
      onLaunch: (Map<String, dynamic> info) async {
        // Si la app esta completamente cerrada
        print('===== On Launch =====');
        print(info);
      },
      onResume: (Map<String, dynamic> info) async {
        // Si la app esta en segundo plano (pero sigue abierta)
        print('===== On Resume =====');
        print(info);
        String arg = 'no-data';
        if (Platform.isAndroid) {
          arg = info['data']['comida'] ?? 'no-data';
        }
        _messagesStreamController.sink.add(arg);
      },
    );
  }
}
