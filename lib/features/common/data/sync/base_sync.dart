import 'package:pami_app/core/services/preferences_service.dart';
import 'package:pami_app/features/common/data/repositories/local_repository_impl.dart';
import 'package:pami_app/features/common/domain/usecase/cdr_usecase.dart';
import 'package:pami_app/features/common/domain/usecase/circunscripcion_usecase.dart';

Future<void> syncBasedData({
  required CircunscripcionUseCase useCase,
  required LocalRepositoryImpl repository,
}) async {
  final lastCirc = await getLastUpdated("circunscripciones_lastUpdated");
  final circunscripciones = await useCase.getCircunscripciones(lastCirc);

  await repository.insertOrUpdateCircunscripcion(circunscripciones);

  if (circunscripciones.isNotEmpty) {
    final newest = circunscripciones
        .map((e) => e.lastModified)
        .reduce((a, b) => a.isAfter(b) ? a : b);

    await saveLastUpdated("circunscripciones_lastUpdated", newest);
  }
}

Future<void> syncCdrs({
  required CdrUseCase useCase,
  required LocalRepositoryImpl repository,
}) async {
  final lastCdr = await getLastUpdated("cdr_lastUpdated");
  final cdrs = await useCase.getCdrs(lastCdr);

  await repository.insertOrUpdateCDR(cdrs);

  if (cdrs.isNotEmpty) {
    final newest = cdrs
        .map((e) => e.lastModified)
        .reduce((a, b) => a.isAfter(b) ? a : b);

    await saveLastUpdated("cdr_lastUpdated", newest);
  }
}
