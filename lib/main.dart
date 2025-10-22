import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/network/dio_provider.dart';
import 'package:pami_app/core/theme/theme.dart';
import 'package:pami_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:pami_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:pami_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:pami_app/features/auth/presentation/viewmodels/auth_providers.dart';
import 'package:pami_app/features/personas/data/datasources/persona_remote_datasource.dart';
import 'package:pami_app/features/personas/data/repositories/persona_repository_impl.dart';
import 'package:pami_app/features/personas/domain/usecases/persona_usecase.dart';
import 'package:pami_app/features/personas/presentation/providers/personas_provider.dart';
import 'package:pami_app/routing/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
          final repo = PersonaRepositoryImpl(dataSource);
          return PersonaUseCase(repo);
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
