import 'package:pami_app/core/services/preferences_service.dart';
import 'package:pami_app/features/common/data/repositories/local_repository_impl.dart';
import 'package:pami_app/features/common/domain/usecase/cdr_usecase.dart';
import 'package:pami_app/features/common/domain/usecase/circunscripcion_usecase.dart';
import 'package:pami_app/features/common/domain/usecase/personas_sync_usecase.dart';

Future<void> syncCircunscripciones({
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

Future<void> syncPacientes({
  required PersonasSyncUseCase useCase,
  required LocalRepositoryImpl repository,
}) async {
  final lastPaciente = await getLastUpdated("pacientes_lastUpdated");
  final pacientes = await useCase.getPacientes(lastPaciente);

  await repository.insertOrUpdatePersonas(pacientes);

  if (pacientes.isNotEmpty) {
    final newest = pacientes
        .map((e) => e.lastModified)
        .reduce((a, b) => a.isAfter(b) ? a : b);

    await saveLastUpdated("pacientes_lastUpdated", newest);
  }
}

Future<void> syncGestantes({
  required PersonasSyncUseCase useCase,
  required LocalRepositoryImpl repository,
}) async {
  final lastGestante = await getLastUpdated("gestante_lastUpdated");
  final gestantes = await useCase.getGestantes(lastGestante);

  await repository.insertOrUpdateGestantes(gestantes);

  if (gestantes.isNotEmpty) {
    final newest = gestantes
        .map((e) => e.lastModified)
        .reduce((a, b) => a.isAfter(b) ? a : b);

    await saveLastUpdated("gestante_lastUpdated", newest);
  }
}

Future<void> syncPuerperas({
  required PersonasSyncUseCase useCase,
  required LocalRepositoryImpl repository,
}) async {
  final lastPuerpera = await getLastUpdated("puerpera_lastUpdated");
  final puerperas = await useCase.getPuerperas(lastPuerpera);

  await repository.insertOrUpdatePuerperas(puerperas);

  if (puerperas.isNotEmpty) {
    final newest = puerperas
        .map((e) => e.lastModified)
        .reduce((a, b) => a.isAfter(b) ? a : b);

    await saveLastUpdated("puerpera_lastUpdated", newest);
  }
}
