import 'package:pami_app/features/personas/domain/entities/persona.dart';
import 'package:pami_app/features/personas/domain/repositories/persona_repository.dart';

class PersonaUseCase {
  final PersonaRepository repository;

  PersonaUseCase(this.repository);

  Future<Persona> call(String ci) {
    return repository.getByCI(ci);
  }
}
