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
    ])..where(db.gestanteTable.isAvailable);

    return query.watch().map((rows) {
      final gestantes = <GestantesResponseModel>[];

      for (final row in rows) {
        final fechaCaptacion = row.readTable(db.gestanteTable).fechaCaptacion;
        final tgCaptacion = row.readTable(db.gestanteTable).tgCaptacion;
        final fechaActual = DateTime.now();

        final difference = fechaActual.difference(fechaCaptacion).inDays;

        final tg = parseSem(tgCaptacion);

        final weeks = difference ~/ 7;
        final days = difference % 7;

        final finalWeeks = tg["weeks"]! + weeks;
        final finalDays = tg["days"]! + days;
        gestantes.add(
          GestantesResponseModel.fromEntity(
            PersonaWithGestanteData(
              persona: row.readTable(db.personasTable),
              gestante: row.readTable(db.gestanteTable),
              tgActual:
                  "${finalWeeks != 0 ? "$finalWeeks" : ''}${finalWeeks != 0 && finalDays != 0 ? "." : ""}${finalDays != 0 ? finalDays : ""}${finalWeeks != 0 ? "sem" : " dias"}",
            ),
          ),
        );
      }
      return gestantes;
    });
  }

  Future<PersonaWithGestanteDetail?> getGestanteByCi(String ci) async {
    final query = db.select(db.gestanteTable).join([
      innerJoin(
        db.personasTable,
        db.personasTable.id.equalsExp(db.gestanteTable.personaId),
      ),
      innerJoin(db.cdrTable, db.cdrTable.id.equalsExp(db.personasTable.cdrId)),
      innerJoin(
        db.circunscripcionTable,
        db.circunscripcionTable.id.equalsExp(db.cdrTable.circunscripcionId),
      ),
    ])..where(db.personasTable.ci.equals(ci.trim()));

    final row = await query.getSingleOrNull();

    if (row == null) return null;

    final fechaCaptacion = row.readTable(db.gestanteTable).fechaCaptacion;
    final tgCaptacion = row.readTable(db.gestanteTable).tgCaptacion;
    final fechaActual = DateTime.now();

    final difference = fechaActual.difference(fechaCaptacion).inDays;

    final tg = parseSem(tgCaptacion);

    final weeks = difference ~/ 7;
    final days = difference % 7;

    final finalWeeks = tg["weeks"]! + weeks;
    final finalDays = tg["days"]! + days;

    return PersonaWithGestanteDetail(
      persona: row.readTable(db.personasTable),
      gestante: row.readTable(db.gestanteTable),
      cdr: row.readTable(db.cdrTable),
      circunscripcion: row.readTable(db.circunscripcionTable),
      tgActual:
          "${finalWeeks != 0 ? "$finalWeeks" : ''}${finalWeeks != 0 && finalDays != 0 ? "." : ""}${finalDays != 0 ? finalDays : ""}${finalWeeks != 0 ? "sem" : " dias"}",
    );
  }

  Map<String, int> parseSem(String input) {
    final regex = RegExp(r'^(\d+)(?:\.(\d+))?sem$');

    final match = regex.firstMatch(input);
    if (match == null) {
      throw FormatException("Formato inválido");
    }

    final entero = match.group(1) != null ? int.parse(match.group(1)!) : 0;
    final decimal = match.group(2) != null ? int.parse(match.group(2)!) : 0;

    return {"weeks": entero, "days": decimal};
  }
}
