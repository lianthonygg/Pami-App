import 'package:drift/drift.dart';

@DataClassName('PersonasEntity')
class PersonasTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text()();
  IntColumn get edad => integer()();
}
