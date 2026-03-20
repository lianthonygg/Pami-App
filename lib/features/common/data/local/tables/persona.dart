import 'package:drift/drift.dart';
import 'package:pami_app/features/common/data/local/tables/cdr.dart';
import 'package:uuid/uuid.dart';

@DataClassName('PersonasEntity')
class PersonasTable extends Table {
  TextColumn get id => text().clientDefault(() => Uuid().v4())();
  TextColumn get fullName => text().withLength(min: 1, max: 100)();
  TextColumn get ci => text().withLength(min: 1, max: 11)();
  TextColumn get sexo => text().withLength(min: 1, max: 10)();
  TextColumn get raza => text().withLength(min: 1, max: 10)();
  TextColumn get direccionCi =>
      text().nullable().withLength(min: 0, max: 500)();
  TextColumn get direccionVive =>
      text().nullable().withLength(min: 0, max: 500)();
  TextColumn get telefono => text().nullable().withLength(min: 0, max: 10)();
  TextColumn get antPP => text().withLength(min: 0, max: 500)();
  TextColumn get nivelEscolar =>
      text().nullable().withLength(min: 0, max: 100)();
  TextColumn get profesion => text().nullable().withLength(min: 0, max: 300)();
  TextColumn get grupoDispensarial => text().withLength(min: 1, max: 50)();
  TextColumn get observaciones =>
      text().nullable().withLength(min: 0, max: 500)();

  BoolColumn get isController => boolean().withDefault(const Constant(false))();
  BoolColumn get isAvailable => boolean().withDefault(const Constant(true))();
  BoolColumn get isGestante => boolean().withDefault(const Constant(true))();

  TextColumn get cdrId => text().references(CdrTable, #id)();

  @override
  Set<Column> get primaryKey => {id};
}
