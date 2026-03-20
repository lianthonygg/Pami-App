import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final StreamController<NotificationResponse> selectNotificationStream =
      StreamController<NotificationResponse>.broadcast();

  static const MethodChannel platform = MethodChannel(
    'dexterx.dev/flutter_local_notifications_example',
  );

  static const String portName = 'notification_send_port';

  static String? selectedNotificationPayload;

  static const String urlLaunchActionId = 'id_1';
  static const String navigationActionId = 'id_3';
  static const String darwinNotificationCategoryText = 'textCategory';
  static const String darwinNotificationCategoryPlain = 'plainCategory';

  @pragma('vm:entry-point')
  static void notificationTapBackground(
    NotificationResponse notificationResponse,
  ) {
    // ignore: avoid_print
    print(
      'notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}',
    );
    if (notificationResponse.input?.isNotEmpty ?? false) {
      // ignore: avoid_print
      print(
        'notification action tapped with input: ${notificationResponse.input}',
      );
    }
  }

  static const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  static final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  static Future<void> inicialized() async {
    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: selectNotificationStream.add,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        !kIsWeb && Platform.isLinux
            ? null
            : await _notificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      selectedNotificationPayload =
          notificationAppLaunchDetails!.notificationResponse?.payload;
      // ignore: avoid_print
      print(
        '🚀 App lanzada desde una notificación con payload: $selectedNotificationPayload',
      );
    }
  }

  static Future<void> show(String title, String body) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'sync_channel',
          'Sincronización',
          channelDescription: 'Notificaciones del proceso de sincronización',
          importance: Importance.max,
          priority: Priority.high,
          showProgress: true,
          onlyAlertOnce: true,
        );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    await _notificationsPlugin.show(0, title, body, platformDetails);
  }

  static Future<void> update(String title, String body) async {
    await show(title, body);
  }

  static Future<void> hide() async {
    await _notificationsPlugin.cancel(0);
  }
}

Future<void> requestNotificationPermission() async {
  if (Platform.isAndroid) {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final androidImplementation =
        flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();

    final granted =
        await androidImplementation?.areNotificationsEnabled() ?? false;

    if (!granted) {
      final status = await Permission.notification.request();
      if (status.isGranted) {
        if (kDebugMode) {
          print("✅ Permiso de notificaciones concedido");
        }
      } else {
        if (kDebugMode) {
          print("🚫 Permiso de notificaciones denegado");
        }
      }
    }
  }
}
