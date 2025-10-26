import 'package:pami_app/features/personas/data/model/create_persona_model.dart';
import 'package:pami_app/features/personas/domain/entities/persona.dart';
import 'package:pami_app/features/personas/domain/repositories/persona_repository.dart';

class PersonaUseCase {
  final PersonaRepository repository;

  PersonaUseCase(this.repository);

  Future<List<Persona>> all() {
    return repository.getAll();
  }

  Future<Persona> call(String ci) {
    return repository.getByCI(ci);
  }

  Future<CreatePersonaResponse> create(CreatePersonaRequest request) {
    return repository.createPerson(request);
  }
}
