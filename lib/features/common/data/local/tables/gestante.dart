import 'package:drift/drift.dart';
import 'package:pami_app/features/common/data/local/tables/persona.dart';
import 'package:uuid/uuid.dart';

@DataClassName('GestanteEntity')
class GestanteTable extends Table {
  TextColumn get id => text().clientDefault(() => Uuid().v4())();

  TextColumn get antPp => text()();
  TextColumn get observaciones => text()();
  TextColumn get tgCaptacion => text()();
  TextColumn get tgFinal => text()();

  DateTimeColumn get fum => dateTime()();

  TextColumn get gestaciones => text()();
  TextColumn get partos => text()();
  TextColumn get abortos => text()();
  TextColumn get cesareas => text()();
  TextColumn get antPPretermino => text()();

  DateTimeColumn get fechaCaptacion => dateTime()();
  DateTimeColumn get fechaProbableParto => dateTime()();

  TextColumn get rciu => text()();
  TextColumn get imc => text()();

  IntColumn get clasificacionRiesgo => integer()();

  TextColumn get personaId =>
      text().references(PersonasTable, #id, onDelete: KeyAction.cascade)();

  BoolColumn get isAvailable => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}
