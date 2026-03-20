import 'package:drift/drift.dart';
import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/pregestograma/data/model/pregestante_model.dart';
import 'package:pami_app/features/pregestograma/domain/entities/pregestante.dart';
import 'package:pami_app/features/pregestograma/domain/repositories/pregestante_repository.dart';

class PregestanteRepositoryImpl implements PregestanteRepository {
  final AppDatabase db;

  PregestanteRepositoryImpl(this.db);

  @override
  Future<List<Pregestante>> getAll() async {
    final hoy = DateTime.now();

    final mujeres =
        await (db.select(db.personasTable)
          ..where((p) => p.sexo.equals('F') & p.isGestante.not())).get();

    final pregestantes =
        mujeres
            .where((p) {
              final fechaNac = tryParseCiToDate(p.ci);
              if (fechaNac == null) return false;
              final edad = calculateEdad(fechaNac, hoy);
              return edad >= 11 && edad <= 49;
            })
            .map((p) => PregestanteModel.fromEntity(p))
            .toList();

    return pregestantes;
  }

  DateTime? tryParseCiToDate(String ci) {
    if (ci.isEmpty || ci.length < 6) return null;

    final yy = int.tryParse(ci.substring(0, 2));
    final mm = int.tryParse(ci.substring(2, 4));
    final dd = int.tryParse(ci.substring(4, 6));

    if (yy == null || mm == null || dd == null) return null;

    final hoy = DateTime.now();
    final year = (yy + 2000 > hoy.year) ? yy + 1900 : yy + 2000;

    try {
      return DateTime(year, mm, dd);
    } catch (_) {
      return null;
    }
  }

  int calculateEdad(DateTime fechaNac, DateTime hoy) {
    int edad = hoy.year - fechaNac.year;
    if (DateTime(hoy.year, fechaNac.month, fechaNac.day).isAfter(hoy)) {
      edad--;
    }
    return edad;
  }
}
