import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/services/notification_service.dart';
import 'package:pami_app/core/theme/theme.dart';
import 'package:pami_app/features/common/data/local/db_provider.dart';
import 'package:pami_app/routing/router.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'background/sync_tasks.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await requestNotificationPermission();
  await NotificationService.inicialized();

  // Registra el puerto antes de todo
  IsolateNameServer.removePortNameMapping('db_sync_port'); // limpia si existe
  final receivePort = ReceivePort();
  IsolateNameServer.registerPortWithName(receivePort.sendPort, 'db_sync_port');

  await Workmanager().initialize(callbackDispatcher);

  await Workmanager().registerPeriodicTask(
    "sync_circunscripciones_task",
    "syncBaseTables",
    frequency: const Duration(hours: 1),
    constraints: Constraints(networkType: NetworkType.connected),
  );

  await Workmanager().registerPeriodicTask(
    "process_sync_queue_task",
    "processSyncQueue",
    frequency: const Duration(minutes: 15),
    constraints: Constraints(networkType: NetworkType.connected),
  );

  runApp(ProviderScope(child: MainApp(receivePort: receivePort)));
}

class MainApp extends ConsumerWidget {
  final ReceivePort receivePort;
  const MainApp({super.key, required this.receivePort});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    receivePort.listen((message) {
      if (message == 'sync_done') {
        ref.invalidate(databaseProvider);
      }
    });

    return MaterialApp.router(
      locale: const Locale('es', 'ES'),
      supportedLocales: const [Locale('es', 'ES')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      title: "Pami App",
      routerConfig: router(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        final color =
            Theme.of(context).appBarTheme.backgroundColor ??
            Theme.of(context).primaryColor;

        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: color,
            systemNavigationBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        );

        return child!;
      },
    );
  }
}
