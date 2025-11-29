import 'package:drift/drift.dart';
import 'package:pami_app/features/common/data/local/database.dart';
import 'package:pami_app/features/common/data/local/tables/cdr.dart';
import 'package:pami_app/features/common/data/local/tables/circunscripcion.dart';
import 'package:pami_app/features/common/data/local/tables/gestante.dart';
import 'package:pami_app/features/common/data/local/tables/persona.dart';
import 'package:pami_app/features/common/data/local/tables/puerpera.dart';
import 'package:uuid/uuid.dart';

part "app_database.g.dart";

@DriftDatabase(
  tables: [
    CircunscripcionTable,
    CdrTable,
    PersonasTable,
    GestanteTable,
    PuerperaTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;
}
