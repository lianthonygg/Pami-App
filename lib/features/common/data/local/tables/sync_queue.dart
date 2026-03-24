import 'package:drift/drift.dart';

@DataClassName('SyncQueueEntity')
class SyncQueueTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text()(); // 'persona', 'gestante', etc.
  TextColumn get payload => text()(); // JSON del request
  IntColumn get priority => integer().withDefault(const Constant(0))();
  IntColumn get retries => integer().withDefault(const Constant(0))();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  // 'pending' | 'syncing' | 'error' | 'done'
  TextColumn get errorMessage => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
