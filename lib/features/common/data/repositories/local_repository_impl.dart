import 'package:drift/drift.dart';
import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/domain/entities/cdr.dart';
import 'package:pami_app/features/common/domain/entities/circunscripcion.dart';
import 'package:pami_app/features/common/domain/repositories/local_repository.dart';

class LocalRepositoryImpl implements LocalRepository {
  final AppDatabase db;

  LocalRepositoryImpl(this.db);

  @override
  Future<void> insertOrUpdateCircunscripcion(
    List<Circunscripcion> circunscripciones,
  ) async {
    await db.batch((batch) {
      for (final circ in circunscripciones) {
        batch.insert(
          db.circunscripcionTable,
          CircunscripcionTableCompanion(
            id: Value(circ.id),
            numero: Value(circ.numero),
            delegado: Value(circ.delegado),
            zona: Value(circ.zona),
            consejoPopular: Value(circ.consejoPopular),
            isAvailable: Value(true),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  @override
  Stream<List<CircunscripcionEntity>> watchAllCircunscripciones() {
    return db.select(db.circunscripcionTable).watch();
  }

  @override
  Future<void> insertOrUpdateCDR(List<Cdr> cdrs) async {
    await db.batch((batch) {
      for (final cdr in cdrs) {
        batch.insert(
          db.cdrTable,
          CdrTableCompanion(
            id: Value(cdr.id),
            numero: Value(cdr.numero),
            presidente: Value(cdr.presidente),
            circunscripcionId: Value(cdr.circunscripcion),
            isAvailable: Value(true),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  @override
  Stream<List<CdrEntity>> watchCdrsByCircunscripcion(String circunscripcionId) {
    return (db.select(
      db.cdrTable,
    )..where((cdr) => cdr.circunscripcionId.equals(circunscripcionId))).watch();
  }
}
