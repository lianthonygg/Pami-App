import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/core/network/connectivity_service.dart';
import 'package:pami_app/features/common/domain/usecase/sync_queue_usecase.dart';
import 'package:pami_app/features/common/presentation/providers/usecase_provider.dart';
import 'package:pami_app/features/gestograma/data/model/create_gestante_model.dart';
import 'package:pami_app/features/gestograma/domain/entities/gestante.dart';
import 'package:pami_app/features/gestograma/domain/usecases/gestante_usecase.dart';
import 'package:pami_app/features/gestograma/presentation/providers/usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gestantes_viewmodel.g.dart';

@riverpod
class GestantesViewModel extends _$GestantesViewModel {
  late final GestanteUseCase gestanteUseCase;
  late final SyncQueueUseCase syncQueueUseCase;

  @override
  GestantesState build() {
    gestanteUseCase = ref.watch(gestanteUseCaseProvider);
    syncQueueUseCase = ref.watch(syncQueueUseCaseProvider);
    return GestantesState();
  }

  Future<void> getAll() async {
    state = state.copyWith(isLoading: true, error: null);

    gestanteUseCase.watchGestantes().listen((gestantes) {
      state = state.copyWith(isLoading: false, items: gestantes);
    });
  }

  Future<void> createGestante(CreateGestanteRequest request) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // 1. Guarda en DB local siempre
      await gestanteUseCase.saveLocal(request);

      // 2. Intenta subir si hay internet
      if (await hasInternet()) {
        try {
          await gestanteUseCase.create(request);
          // subió directo, no hace falta encolar
        } catch (e) {
          // falló el servidor → encola
          await syncQueueUseCase.enqueue(
            entityType: 'persona',
            payload: request.toJson(),
          );
        }
      } else {
        // sin internet → encola directamente
        await syncQueueUseCase.enqueue(
          entityType: 'persona',
          payload: request.toJson(),
        );
      }

      state = state.copyWith(isLoading: false);
    } on ServerException catch (e) {
      state = state.copyWith(isLoading: false, error: e.detail);
    }

    //try {
    // final response = await personaUseCase.create(request);
    // state = state.copyWith(isLoading: false, response: response);
    // } on ServerException catch (e) {
    //   state = state.copyWith(isLoading: false, error: e.detail);
    // } catch (e) {
    //   state = state.copyWith(isLoading: false, error: e.toString());
    // }
  }
}

class GestantesState {
  final bool isLoading;
  final List<Gestante>? items;
  final String? error;

  GestantesState({this.isLoading = false, this.error, this.items});

  GestantesState copyWith({
    bool? isLoading,
    String? error,
    List<Gestante>? items,
  }) {
    return GestantesState(
      isLoading: isLoading ?? this.isLoading,
      items: items,
      error: error,
    );
  }
}
