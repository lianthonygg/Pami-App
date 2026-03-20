import 'package:drift/drift.dart';
import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/posgestograma/data/model/puerpera_model.dart';
import 'package:pami_app/features/posgestograma/domain/entities/puerpera.dart';

class PuerperaLocalDataSource {
  final AppDatabase db;

  PuerperaLocalDataSource(this.db);

  Stream<List<PuerperasResponseModel>> watchPuerperas() {
    final query = db.select(db.puerperaTable).join([
      innerJoin(
        db.personasTable,
        db.personasTable.id.equalsExp(db.puerperaTable.personaId),
      ),
    ]);

    return query.watch().map((rows) {
      final puerperas = <PuerperasResponseModel>[];

      for (final row in rows) {
        puerperas.add(
          PuerperasResponseModel.fromEntity(
            PersonaWithPuerperaData(
              persona: row.readTable(db.personasTable),
              puerpera: row.readTable(db.puerperaTable),
            ),
          ),
        );
      }
      return puerperas;
    });
  }
}
