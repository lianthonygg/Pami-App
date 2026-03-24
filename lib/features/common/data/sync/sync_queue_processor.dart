import 'dart:convert';

import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/core/services/notification_service.dart';
import 'package:pami_app/features/common/domain/repositories/sync_queue_repository.dart';

class SyncQueueProcessor {
  final SyncQueueRepository queueRepo;
  final Map<String, Future<void> Function(Map<String, dynamic>)> handlers;

  SyncQueueProcessor({required this.queueRepo, required this.handlers});

  Future<void> process() async {
    final pending = await queueRepo.getPending();

    pending.sort((a, b) => b.priority.compareTo(a.priority));

    for (final entry in pending) {
      final handler = handlers[entry.entityType];
      if (handler == null) continue;

      try {
        await handler(jsonDecode(entry.payload));
        await queueRepo.markAsDone(entry.id);
      } on ServerException catch (e) {
        // Error del servidor (validación, duplicado, etc.)
        await queueRepo.markAsError(entry.id, e.detail);
        await NotificationService.show(
          'Error al sincronizar',
          'No se pudo subir: ${e.detail}',
        );
      } catch (e) {
        // Error de red u otro → reintenta después
        await queueRepo.incrementRetry(entry.id);
      }
    }
  }
}
