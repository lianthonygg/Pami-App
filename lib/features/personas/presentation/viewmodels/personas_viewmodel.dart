import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/core/network/connectivity_service.dart';
import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/data/model/persona_model.dart';
import 'package:pami_app/features/common/domain/usecase/sync_queue_usecase.dart';
import 'package:pami_app/features/common/presentation/providers/usecase_provider.dart';
import 'package:pami_app/features/personas/data/model/create_persona_model.dart';
import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/personas/domain/usecases/persona_usecase.dart';
import 'package:pami_app/features/personas/presentation/providers/usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'personas_viewmodel.g.dart';

@riverpod
class PersonasViewModel extends _$PersonasViewModel {
  late final PersonaUseCase personaUseCase;
  late final SyncQueueUseCase syncQueueUseCase;

  @override
  PersonasState build() {
    personaUseCase = ref.read(personaUseCaseProvider);
    syncQueueUseCase = ref.read(syncQueueUseCaseProvider);
    return PersonasState();
  }

  Future<void> getAll() async {
    state = state.copyWith(isLoading: true, error: null);

    personaUseCase.watchPacientes().listen((pacientes) {
      state = state.copyWith(isLoading: false, items: pacientes);
    });
  }

  Future<void> getByCi(String ci) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final persona = await personaUseCase.watchPacienteByCi(ci);
      state = state.copyWith(isLoading: false, data: persona);
    } on ServerException catch (e) {
      state = state.copyWith(isLoading: false, error: e.detail);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> createPerson(CreatePersonaRequest request) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      // 1. Guarda en DB local siempre
      await personaUseCase.saveLocal(request);

      // 2. Intenta subir si hay internet
      if (await hasInternet()) {
        try {
          await personaUseCase.create(request);
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

    // try {
    //   final response = await personaUseCase.create(request);
    //   state = state.copyWith(isLoading: false, response: response);
    // } on ServerException catch (e) {
    //   state = state.copyWith(isLoading: false, error: e.detail);
    // } catch (e) {
    //   state = state.copyWith(isLoading: false, error: e.toString());
    // }
  }
}

class PersonasState {
  final bool isLoading;
  final List<PersonasEntity>? items;
  final CreatePersonaResponse? response;
  final PersonaConCdrYCircunscripcion? data;
  final String? error;

  PersonasState({
    this.isLoading = false,
    this.data,
    this.error,
    this.items,
    this.response,
  });

  PersonasState copyWith({
    bool? isLoading,
    PersonaConCdrYCircunscripcion? data,
    CreatePersonaResponse? response,
    String? error,
    List<PersonasEntity>? items,
  }) {
    return PersonasState(
      isLoading: isLoading ?? this.isLoading,
      data: data,
      items: items,
      error: error,
      response: response,
    );
  }
}
