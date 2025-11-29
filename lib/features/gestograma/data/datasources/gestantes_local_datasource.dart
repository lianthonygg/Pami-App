import 'package:drift/drift.dart';
import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/gestograma/data/model/gestante_model.dart';
import 'package:pami_app/features/gestograma/domain/entities/gestante.dart';

class GestantesLocalDataSource {
  final AppDatabase db;

  GestantesLocalDataSource(this.db);

  Stream<List<GestantesResponseModel>> watchGestantes() {
    final query = db.select(db.gestanteTable).join([
      innerJoin(
        db.personasTable,
        db.personasTable.id.equalsExp(db.gestanteTable.personaId),
      ),
    ]);

    return query.watch().map((rows) {
      final gestantes = <GestantesResponseModel>[];

      for (final row in rows) {
        gestantes.add(
          GestantesResponseModel.fromEntity(
            PersonaWithGestanteData(
              persona: row.readTable(db.personasTable),
              gestante: row.readTable(db.gestanteTable),
            ),
          ),
        );
      }
      return gestantes;
    });
  }
}
