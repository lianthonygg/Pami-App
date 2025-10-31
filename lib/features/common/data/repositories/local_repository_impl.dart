import 'package:drift/drift.dart';
import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/domain/entities/circunscripcion.dart';
import 'package:pami_app/features/common/domain/repositories/local_repository.dart';

class LocalRepositoryImpl implements LocalRepository{
  final AppDatabase db;

  LocalRepositoryImpl(this.db);

  @override
  Future<void> insertOrUpdateCircunscripcion(List<Circunscripcion> circunscripciones) async{
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
}