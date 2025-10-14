import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/network/dio_provider.dart';
import 'package:pami_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:pami_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:pami_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:pami_app/features/auth/presentation/viewmodels/auth_providers.dart';
import 'package:pami_app/routing/router.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        loginUseCaseProvider.overrideWith((ref) {
          final dio = ref.watch(dioProvider);
          final dataSource = AuthRemoteDatasource(dio);
          final repo = AuthRepositoryImpl(dataSource);
          return LoginUseCase(repo);
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
    return MaterialApp.router(title: 'PAMI App', routerConfig: router());
  }
}
