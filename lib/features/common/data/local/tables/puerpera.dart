import 'package:drift/drift.dart';
import 'package:pami_app/features/common/data/local/tables/persona.dart';
import 'package:uuid/uuid.dart';

@DataClassName('PuerperaEntity')
class PuerperaTable extends Table {
  TextColumn get id => text().clientDefault(() => Uuid().v4())();

  TextColumn get antPp => text()();
  TextColumn get observaciones => text()();
  TextColumn get gestaciones => text()();
  TextColumn get partos => text()();
  TextColumn get abortos => text()();
  TextColumn get cesareas => text()();
  TextColumn get antPPretermino => text()();

  IntColumn get tipoParto => integer()();

  TextColumn get personaId =>
      text().references(PersonasTable, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {id};
}
