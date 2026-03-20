import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

@DataClassName('CircunscripcionEntity')
class CircunscripcionTable extends Table {
  TextColumn get id => text().clientDefault(() => Uuid().v4())();

  TextColumn get numero => text().withLength(min: 1, max: 100)();
  TextColumn get delegado => text().withLength(min: 1, max: 100)();
  TextColumn get zona => text().nullable().withLength(min: 0, max: 100)();

  TextColumn get consejoPopular => text().nullable()();

  BoolColumn get isAvailable => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}
