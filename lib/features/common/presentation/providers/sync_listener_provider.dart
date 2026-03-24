// sync_listener_provider.dart
import 'dart:isolate';
import 'dart:ui';
import 'package:pami_app/features/personas/presentation/viewmodels/personas_viewmodel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_listener_provider.g.dart';

@riverpod
void syncListener(Ref ref) {
  // <-- Ref unificado, sin ExampleRef
  final receivePort = ReceivePort();

  IsolateNameServer.registerPortWithName(receivePort.sendPort, 'db_sync_port');

  receivePort.listen((message) {
    print('🟢 Mensaje recibido: $message');
    if (message == 'sync_done') {
      ref.invalidate(personasViewModelProvider);
    }
  });

  ref.onDispose(() {
    IsolateNameServer.removePortNameMapping('db_sync_port');
    receivePort.close();
  });
}
