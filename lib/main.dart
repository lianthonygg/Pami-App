import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/services/notification_service.dart';
import 'package:pami_app/core/theme/theme.dart';
import 'package:pami_app/routing/router.dart';
import 'package:workmanager/workmanager.dart';

import 'background/sync_tasks.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await requestNotificationPermission();
  await NotificationService.inicialized();

  await Workmanager().initialize(callbackDispatcher);

  await Workmanager().registerPeriodicTask(
    "sync_circunscripciones_task",
    "syncBaseTables",
    frequency: const Duration(hours: 1),
    constraints: Constraints(networkType: NetworkType.connected),
  );

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFE53935),
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );

    return MaterialApp.router(
      title: 'PAMI App',
      routerConfig: router(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
