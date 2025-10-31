import 'package:flutter/foundation.dart';
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
  Workmanager().executeTask((task, inputData) async{
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

    switch(task) {
      case "syncBaseTables":
        await syncBasedData(useCase: useCase, repository: localRepo);
        break;
    }

    return Future.value(true);
  });
}