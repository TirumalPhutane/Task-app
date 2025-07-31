import 'dart:io';

import 'package:demo/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin plugin =
      flutterLocalNotificationsPlugin;

  static void showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    final byteData = await rootBundle.load('assets/images/flutter-clouds.jpg');
    final file = File(
      '${(await getApplicationDocumentsDirectory()).path}/flutter-clouds.jpg',
    );
    await file.writeAsBytes(byteData.buffer.asUint8List());

    final bigPictureStyle = BigPictureStyleInformation(
      FilePathAndroidBitmap(file.path),
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      contentTitle: message.notification?.title,
      summaryText: message.notification?.body,
    );

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            importance: Importance.max,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
            //icon: '@drawable/icon_notification'
            sound: RawResourceAndroidNotificationSound('notification'),
            playSound: true,
            styleInformation: bigPictureStyle,
          ),
        ),
        payload: message.data['name'],
      );
    }
  }
}
