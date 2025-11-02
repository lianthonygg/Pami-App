import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/domain/entities/cdr.dart';
import 'package:pami_app/features/common/domain/entities/circunscripcion.dart';

abstract class LocalRepository {
  Future<void> insertOrUpdateCircunscripcion(
    List<Circunscripcion> circunscripciones,
  );

  Stream<List<CircunscripcionEntity>> watchAllCircunscripciones();

  Future<void> insertOrUpdateCDR(List<Cdr> cdrs);

  Stream<List<CdrEntity>> watchCdrsByCircunscripcion(String circunscripcionId);
}
