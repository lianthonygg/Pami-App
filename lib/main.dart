import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/network/dio_client.dart';
import 'package:pami_app/core/network/dio_provider.dart';
import 'package:pami_app/core/theme/theme.dart';
import 'package:pami_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:pami_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:pami_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:pami_app/features/auth/presentation/viewmodels/auth_providers.dart';
import 'package:pami_app/features/common/data/datasources/common_remote_datasource.dart';
import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/data/local/db_provider.dart';
import 'package:pami_app/features/common/data/repositories/common_repository_impl.dart';
import 'package:pami_app/features/common/data/repositories/local_repository_impl.dart';
import 'package:pami_app/features/common/data/sync/base_sync.dart';
import 'package:pami_app/features/common/domain/usecase/cdr_usecase.dart';
import 'package:pami_app/features/common/domain/usecase/circunscripcion_usecase.dart';
import 'package:pami_app/features/personas/data/datasources/persona_remote_datasource.dart';
import 'package:pami_app/features/personas/data/repositories/persona_repository_impl.dart';
import 'package:pami_app/features/personas/domain/usecases/persona_usecase.dart';
import 'package:pami_app/features/personas/presentation/providers/personas_provider.dart';
import 'package:pami_app/features/pregestograma/data/datasource/pregestante_remote_datasource.dart';
import 'package:pami_app/features/pregestograma/data/repositories/pregestante_repository_impl.dart';
import 'package:pami_app/features/pregestograma/domain/usecases/pregestantes_usecase.dart';
import 'package:pami_app/features/pregestograma/presentation/providers/pregestantes_provider.dart';
import 'package:pami_app/routing/router.dart';
import 'package:workmanager/workmanager.dart';

import 'background/sync_tasks.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Workmanager().initialize(
    callbackDispatcher,
  );

  await Workmanager().registerPeriodicTask(
    "sync_circunscripciones_task",
    "syncBaseTables",
    frequency: const Duration(hours: 12),
    initialDelay: const Duration(minutes: 10),
  );

  final dioClient = DioClient();
  final dataSource = CommonRemoteDatasource(dioClient.dio);
  final remoteRepo = CommonRepositoryImpl(dataSource);
  final db = AppDatabase();
  final localRepo = LocalRepositoryImpl(db);
  final useCase = CircunscripcionUseCase(remoteRepo, localRepo);
  await syncBasedData(useCase: useCase, repository: localRepo);

  runApp(
    ProviderScope(
      overrides: [
        loginUseCaseProvider.overrideWith((ref) {
          final dio = ref.watch(dioProvider);
          final dataSource = AuthRemoteDatasource(dio);
          final repo = AuthRepositoryImpl(dataSource);
          return LoginUseCase(repo);
        }),
        personasUseCaseProvider.overrideWith((ref) {
          final dio = ref.watch(dioProvider);
          final dataSource = PersonaRemoteDatasource(dio);
          final commonDataSource = CommonRemoteDatasource(dio);
          final repo = PersonaRepositoryImpl(dataSource);
          final commonRepo = CommonRepositoryImpl(commonDataSource);
          return PersonaUseCase(repo, commonRepo);
        }),
        circunscripcionesUseCaseProvider.overrideWith((ref) {
          final dio = ref.watch(dioProvider);
          final dataSource = CommonRemoteDatasource(dio);
          final repo = CommonRepositoryImpl(dataSource);
          final db = ref.watch(databaseProvider);
          final localRepo = LocalRepositoryImpl(db);
          return CircunscripcionUseCase(repo, localRepo);
        }),
        cdrUseCaseProvider.overrideWith((ref) {
          final dio = ref.watch(dioProvider);
          final dataSource = CommonRemoteDatasource(dio);
          final repo = CommonRepositoryImpl(dataSource);
          return CdrUseCase(repo);
        }),
        pregestantesUseCaseProvider.overrideWith((ref) {
          final dio = ref.watch(dioProvider);
          final dataSource = PregestanteRemoteDatasource(dio);
          final commonDataSource = CommonRemoteDatasource(dio);
          final repo = PregestanteRepositoryImpl(dataSource);
          final commonRepo = CommonRepositoryImpl(commonDataSource);
          return PregestantesUseCase(repo, commonRepo);
        }),
      ],
      child: const MyApp(),
    ),
  );
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
