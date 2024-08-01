import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title : ${message.notification!.title}');
  print("Body : ${message.notification!.body}");
  print("Payload : ${message.data}");
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class FirebaseApi{
  final firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if(message == null) return;

    navigatorKey.currentState?.context.goNamed('dashboard', pathParameters: {'pageIndex' : '0'}, extra: {'message': message});

  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission(

    );
    final fCMToken = await firebaseMessaging.getToken();
    print('Token : $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initPushNotifications();

  }
}