import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:latihan_bloc/service/notify.dart';

class FbMessaging {
  FbMessaging._();
  static final FbMessaging instance = FbMessaging._();

  // get instance
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  String? selectedNotificationPayload;

  // set configuration
  void initFireMessaging() async {
    // p('-- [FIREBASE MESSAGING], Listening to firebase messaging.');

    firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        log('getInitialMessage data: ${message.data}');
        log('getInitialMessage notification: ${message.notification}');
        log('getInitialMessage notification title: ${message.notification?.title}');
        log('getInitialMessage notification body: ${message.notification?.body}');
      }
    });

    // init flutter local notification
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      selectedNotificationPayload =
          notificationAppLaunchDetails!.notificationResponse?.payload;
    }

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      // onSelectNotification is a function to handle notif responses
      await onSelectNotification(
          notificationAppLaunchDetails?.notificationResponse?.payload);
    }

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {
      await onSelectNotification(notificationResponse.payload);
    });

    // when app is in background
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        String payload = json.encode(message.data);
        Notify.showNotification('${notification.title}', '${notification.body}',
            payload: payload);
      }
    });

    // when app is in background but opened and user tap on notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;

      if (notification != null) {
        String payload = json.encode(message.data);
        await onSelectNotification(payload);
      }
    });
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null && payload.toString().trim().isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        try {
          // wait until page is ready

          // wait for 300 ms, or page will not opened
          // Timer(const Duration(milliseconds: 300), () async {
          //   Map<String, dynamic> map = json.decode(payload);
          //   Get.toNamed(Routes.NOTIFICATION, arguments: map);
          // });
        } catch (e) {
          log(e.toString());
        }
      });
    }
  }

  // subscribe to topic
  /// key = String or List
  static Future subscribeTopic(dynamic key) async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    if (key is String) {
      await firebaseMessaging.subscribeToTopic(key);
    } else if (key is List) {
      for (var k in key) {
        await firebaseMessaging.subscribeToTopic(k);
      }
    } else {}
  }

  // unsubscribe to topic
  /// key = String or List
  static Future unsubscribeTopic(dynamic key) async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    if (key is String) {
      await firebaseMessaging.unsubscribeFromTopic(key);
    } else if (key is List) {
      for (var k in key) {
        await firebaseMessaging.unsubscribeFromTopic(k);
      }
    } else {}
  }
}
