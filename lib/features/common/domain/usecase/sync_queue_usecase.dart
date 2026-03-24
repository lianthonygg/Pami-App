import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/domain/repositories/sync_queue_repository.dart';

class SyncQueueUseCase {
  final SyncQueueRepository syncQueueRepository;

  SyncQueueUseCase({required this.syncQueueRepository});

  Future<void> enqueue({
    required String entityType,
    required Map<String, dynamic> payload,
    int priority = 0,
  }) async {
    await syncQueueRepository.enqueue(entityType: entityType, payload: payload);
  }

  Future<List<SyncQueueEntity>> getPending() async {
    return await syncQueueRepository.getPending();
  }

  Future<void> markAsDone(int id) async {
    await syncQueueRepository.markAsDone(id);
  }

  Future<void> markAsError(int id, String message) async {
    await syncQueueRepository.markAsError(id, message);
  }

  Future<void> incrementRetry(int id) async {
    await syncQueueRepository.incrementRetry(id);
  }
}
