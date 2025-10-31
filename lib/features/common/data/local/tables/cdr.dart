import 'package:drift/drift.dart';
import 'circunscripcion.dart';
import 'package:uuid/uuid.dart';

@DataClassName('CdrEntity')
class CdrTable extends Table {
  TextColumn get id => text().clientDefault(() => Uuid().v4())();

  TextColumn get numero => text().withLength(min: 1, max: 100)();
  TextColumn get presidente => text().nullable().withLength(min: 0, max: 100)();
  TextColumn get sector => text().nullable().withLength(min: 0, max: 100)();

  TextColumn get circunscripcionId =>
      text().references(CircunscripcionTable, #id)();

  BoolColumn get isAvailable => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}
