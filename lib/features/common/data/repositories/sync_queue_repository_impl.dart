import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/domain/repositories/sync_queue_repository.dart';

class SyncQueueRepositoryImpl implements SyncQueueRepository {
  final AppDatabase db;

  SyncQueueRepositoryImpl(this.db);

  @override
  Future<void> enqueue({
    required String entityType,
    required Map<String, dynamic> payload,
    int priority = 0,
  }) async {
    await db
        .into(db.syncQueueTable)
        .insert(
          SyncQueueTableCompanion.insert(
            entityType: entityType,
            payload: jsonEncode(payload),
            priority: Value(priority),
            status: const Value('pending'),
          ),
        );
  }

  @override
  Future<List<SyncQueueEntity>> getPending() async {
    return await (db.select(db.syncQueueTable)
          ..where(
            (q) => q.status.equals('pending') & q.retries.isSmallerThanValue(3),
          )
          ..orderBy([
            (q) => OrderingTerm.desc(q.priority),
            (q) => OrderingTerm.asc(q.createdAt),
          ]))
        .get();
  }

  @override
  Future<void> markAsDone(int id) async {
    await (db.update(db.syncQueueTable)..where(
      (q) => q.id.equals(id),
    )).write(const SyncQueueTableCompanion(status: Value('done')));
  }

  @override
  Future<void> markAsError(int id, String message) async {
    await (db.update(db.syncQueueTable)..where((q) => q.id.equals(id))).write(
      SyncQueueTableCompanion(
        status: const Value('error'),
        errorMessage: Value(message),
      ),
    );
  }

  @override
  Future<void> incrementRetry(int id) async {
    final entry =
        await (db.select(db.syncQueueTable)
          ..where((q) => q.id.equals(id))).getSingle();

    await (db.update(db.syncQueueTable)..where(
      (q) => q.id.equals(id),
    )).write(SyncQueueTableCompanion(retries: Value(entry.retries + 1)));
  }
}
