import 'package:pami_app/features/common/data/local/app_database.dart';

abstract class SyncQueueRepository {
  Future<void> enqueue({
    required String entityType,
    required Map<String, dynamic> payload,
    int priority = 0,
  });
  Future<List<SyncQueueEntity>> getPending();
  Future<void> markAsDone(int id);
  Future<void> markAsError(int id, String message);
  Future<void> incrementRetry(int id);
}
