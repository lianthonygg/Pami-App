import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/features/personas/data/model/create_persona_model.dart';
import 'package:pami_app/features/personas/domain/entities/persona.dart';
import 'package:pami_app/features/personas/domain/usecases/persona_usecase.dart';

class PersonasViewModel extends StateNotifier<PersonasState> {
  final PersonaUseCase personaUseCase;

  PersonasViewModel(this.personaUseCase) : super(PersonasState());

  Future<void> getByCi(String ci) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final persona = await personaUseCase(ci);
      state = state.copyWith(isLoading: false, persona: persona);
    } on ServerException catch (e) {
      state = state.copyWith(isLoading: false, error: e.detail);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> createPerson(CreatePersonaRequest request) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await personaUseCase.create(request);
      state = state.copyWith(isLoading: false, response: response);
    } on ServerException catch (e) {
      state = state.copyWith(isLoading: false, error: e.detail);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

class PersonasState {
  final bool isLoading;
  final Persona? persona;
  final CreatePersonaResponse? response;
  final String? error;

  PersonasState({
    this.isLoading = false,
    this.persona,
    this.error,
    this.response,
  });

  PersonasState copyWith({
    bool? isLoading,
    Persona? persona,
    String? error,
    CreatePersonaResponse? response,
  }) {
    return PersonasState(
      isLoading: isLoading ?? this.isLoading,
      persona: persona,
      error: error,
      response: response,
    );
  }
}
