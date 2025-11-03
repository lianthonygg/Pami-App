import 'package:flutter/foundation.dart';
import 'package:pami_app/core/services/auth_service.dart';
import 'package:pami_app/core/services/notification_service.dart';
import 'package:pami_app/features/common/domain/usecase/cdr_usecase.dart';
import 'package:pami_app/features/common/domain/usecase/personas_sync_usecase.dart';
import 'package:workmanager/workmanager.dart';
import 'package:pami_app/core/network/dio_client.dart';
import 'package:pami_app/features/common/data/datasources/common_remote_datasource.dart';
import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/data/repositories/common_repository_impl.dart';
import 'package:pami_app/features/common/data/repositories/local_repository_impl.dart';
import 'package:pami_app/features/common/data/sync/base_sync.dart';
import 'package:pami_app/features/common/domain/usecase/circunscripcion_usecase.dart';
import '../core/network/connectivity_service.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await NotificationService.inicialized();

    try {
      await NotificationService.show(
        'Sincronizando sus datos',
        'Por favor, espere mientras se actualizan sus datos...',
      );

      if (!await hasInternet()) {
        if (kDebugMode) {
          print("No hay internet, se retrasa la sincronización");
        }
        return Future.value(false);
      }

      final dioClient = DioClient();
      final dataSource = CommonRemoteDatasource(dioClient.dio);
      final remoteRepo = CommonRepositoryImpl(dataSource);
      final db = AppDatabase();
      final localRepo = LocalRepositoryImpl(db);
      final useCase = CircunscripcionUseCase(remoteRepo, localRepo);
      final cdrUseCase = CdrUseCase(remoteRepo, localRepo);
      final pacientesUseCase = PersonasSyncUseCase(remoteRepo, localRepo);

      switch (task) {
        case "syncBaseTables":
          final isLoggedIn = await AuthService.isLoggedIn();
          if (!isLoggedIn) {
            await Workmanager().cancelByUniqueName(task);

            return Future.value(true);
          }
          await syncBasedData(useCase: useCase, repository: localRepo);
          await syncCdrs(useCase: cdrUseCase, repository: localRepo);
          await syncPacientes(useCase: pacientesUseCase, repository: localRepo);
          break;
      }

      await NotificationService.update(
        'Sincronización completada',
        'Sus datos han sido sincronizados correctamente.',
      );
    } catch (e) {
      await NotificationService.update(
        'Error de sincronización',
        'Ocurrió un problema al sincronizar sus datos.',
      );
    }

    // await Future.delayed(const Duration(seconds: 3));
    // await NotificationService.hide();

    return Future.value(true);
  });
}
