import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isRefreshToken() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      print('Token Refereshed');
    });
  }

  void requestNotificationPermisions() async {
    // if (Platform.isIOS) {
    //   await messaging.requestPermission(
    //       alert: true,
    //       announcement: true,
    //       badge: true,
    //       carPlay: true,
    //       criticalAlert: true,
    //       provisional: true,
    //       sound: true);
    // }

    NotificationSettings notificationSettings =
        await messaging.requestPermission(
            alert: true,
            announcement: true,
            badge: true,
            carPlay: true,
            criticalAlert: true,
            provisional: true,
            sound: true);

    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      print('user is already granted permisions');
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('user is already granted provisional permisions');
    } else {
      print('User has denied permission');
    }
  }

  // For IoS
  Future forgroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) async {
      RemoteNotification? notification = message.notification;

      print("Notification title: ${notification!.title}");
      print("Notification body: ${notification.body}");
      print("Data: ${message.data.toString()}");
      print("Data MAP Route: ${message..data['route']}");
      print("Data MAP Order ID: ${message.data['order_id']}");

      // For IoS
      if (Platform.isIOS) {
        forgroundMessage();
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (Platform.isAndroid && token != null) {
        initLocalNotifications(context, message);
        showNotification(message);
      }
    });
  }

  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitSettings = const DarwinInitializationSettings();

    var initSettings = InitializationSettings(
        android: androidInitSettings, iOS: iosInitSettings);

    await _flutterLocalNotificationsPlugin.initialize(initSettings,
        onDidReceiveNotificationResponse: (payload) {
      handleMessage(context, message);
    });
  }

  Future<void> handleMessage(BuildContext context, RemoteMessage message) async {
    print('In handleMessage function');

    // Parse the route from the message data
    final route = message.data['route'];
    final orderId = message.data['order_id'];

    print('Route: $route');
    print('ORDER ID : $orderId');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null) {
      if (route != null) {
        switch (route) {
          case 'detail_order_common':
            navigatorKey.currentState?.context.goNamed(
              'detail_order_common',
              pathParameters: {'orderId': '$orderId'},
              extra: {'message': message},
            );
            break;

          case 'detail_order_reward':
            navigatorKey.currentState?.context.goNamed(
              'detail_order_reward',
              pathParameters: {'orderRewardId': '$orderId'},
              extra: {'message': message},
            );
            break;
          case 'notification':
            navigatorKey.currentState?.context.goNamed(
              'notification',
              extra: {'message': message},
            );
            break;
          case 'voucher':
            navigatorKey.currentState?.context.goNamed(
              'voucher',
              extra: {'isNotification': true},
            );
            break;
          default:
            print('Unknown route: $route');
            break;
        }
      } else {
        print('No route found in the message data');
      }
    }

  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
            message.notification!.android!.channelId.toString(),
            message.notification!.android!.channelId.toString(),
            importance: Importance.max,
            showBadge: true,
            playSound: true);

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(androidNotificationChannel.id.toString(),
            androidNotificationChannel.name.toString(),
            channelDescription: 'Flutter Notifications',
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
            ticker: 'ticker',
            sound: androidNotificationChannel.sound);

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleMessage(context, message);
    });
  }
}
