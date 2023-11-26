import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../model/notification_data.dart';


class NotificationViewModel {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    await notificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(NotificationData data) async {
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'notification-youtube',
      'Youtube notification',
      importance: Importance.max,
      priority: Priority.max,
    );
    final NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await notificationsPlugin.show(
      0,
      data.title, // Use the provided title from NotificationData
      data.body, // Use the provided body from NotificationData
      platformChannelSpecifics,
    );
  }

  Future<void> cancelNotification() async {
    await notificationsPlugin.cancel(0); // Cancels the scheduled notification
  }
}
